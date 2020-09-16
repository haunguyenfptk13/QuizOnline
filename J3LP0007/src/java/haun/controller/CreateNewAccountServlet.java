/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.registration.RegistrationCreateError;
import haun.registration.RegistrationDAO;
import haun.registration.RegistrationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author msi
 */
public class CreateNewAccountServlet extends HttpServlet {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CreateNewAccountServlet.class);
    private final String LOGIN_PAGE = "login.html";
    private final String ERRORS_PAGE = "createNewAccount.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String url = ERRORS_PAGE;
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullName");

        RegistrationCreateError errors = new RegistrationCreateError();
        boolean foundErr = false;

        try {
            if (email.trim().length() < 6 || email.trim().length() > 30) {
                foundErr = true;
                errors.setEmailLengthErr("Email is required input from 6 to 30 characters");
            } else if (!email.matches("\\w+@\\w+[.]\\w+")) {
                foundErr = true;
                errors.setEmailInvalid("Email must be valid");
            }
            if (password.trim().length() < 6 || password.trim().length() > 20) {
                foundErr = true;
                errors.setPasswordLengthErr("Password is required input from 6 to 20 characters");
            } else if (!confirm.trim().equals(password.trim())) {
                foundErr = true;
                errors.setConfirmNotMatchPassword("Confirm must match Passord");
            }
            if (fullname.trim().length() < 2 || fullname.trim().length() > 50) {
                foundErr = true;
                errors.setFullNameLengthErr("Full Name is required input from 2 to 50 characters");
            }

            //process
            if (foundErr) {
                request.setAttribute("CREATEERROR", errors);
            } else {
                //call DAO
                RegistrationDTO dto = new RegistrationDTO(email, DigestUtils.sha256Hex(password), fullname, 2, 3);
                RegistrationDAO dao = new RegistrationDAO();
                boolean result = dao.createAccount(dto);

                if (result) {
                    url = LOGIN_PAGE;
                }
            }
        } catch (NamingException ex) {
            logger.error("CreateNewAccountServlet_Naming" + ex.getMessage());
        } catch (SQLException ex) {
            String msg = ex.getMessage();
            logger.error("CreateNewAccountServlet_SQL" + msg);
            if (msg.contains("duplicate")) {
                errors.setEmailIsExist(email + " is existed");
                request.setAttribute("CREATEERROR", errors);
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
