/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.registration.RegistrationCreateError;
import haun.registration.RegistrationDAO;
import haun.status.StatusDAO;
import haun.status.StatusDTO;
import haun.subject.SubjectDAO;
import haun.subject.SubjectDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author msi
 */
public class LoginServlet extends HttpServlet {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(LoginServlet.class);
    private final String INVALID_PAGE = "login.jsp";
    private final String SEARCH_PAGE = "search.jsp";
    private final String QUIZ_PAGE = "quiz.jsp";
    private final String ACTIVE_ACCOUNT_PAGE = "activeAccount.jsp";

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

        String url = INVALID_PAGE;
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");

        RegistrationCreateError errors = new RegistrationCreateError();
        boolean foundErr = false;
        try {
            // check email
            if (email.trim().length() < 6 || email.trim().length() > 30) {
                foundErr = true;
                errors.setEmailLengthErr("Email is required input from 6 to 30 characters");
            } else if (!email.matches("\\w+@\\w+[.]\\w+")) {
                foundErr = true;
                errors.setEmailInvalid("Email must be valid");
            }
            // check password
            if (password.trim().length() < 6 || password.trim().length() > 20) {
                foundErr = true;
                errors.setPasswordLengthErr("Password is required input from 6 to 20 characters");
            }
            if (foundErr) {
                request.setAttribute("CREATEERROR", errors);
            } else {
                //call DAO
                RegistrationDAO dao = new RegistrationDAO();
                //check login
                boolean result = dao.checkLogin(email, DigestUtils.sha256Hex(password));
                //check role
                int role = dao.getRole(email);
                //get full name
                String name = dao.getFullName(email);
                //get status
                int statusID = dao.getStatusID(email);
                System.out.println(statusID);
                //call subjectDAO
                //get list subjectID
                SubjectDAO daoSubject = new SubjectDAO();
                daoSubject.getListSubject();
                List<SubjectDTO> subjectList = daoSubject.getSubjectList();
                //call statusDAO
                //get list statusName
                StatusDAO daoStatus = new StatusDAO();
                daoStatus.getListStatus();
                List<StatusDTO> statusList = daoStatus.getStatusList();
                //process
                if (result) {
                    HttpSession session = request.getSession();
                    session.setAttribute("EMAIL", email);
                    session.setAttribute("FULLNAME", name);
                    session.setAttribute("SUBJECTLIST", subjectList);
                    session.setAttribute("STATUSLIST", statusList);
                    if (statusID == 1) {
                        if (role == 1) {
                            url = SEARCH_PAGE;
                        } else {
                            url = QUIZ_PAGE;
                        }
                    }else{
                        url = ACTIVE_ACCOUNT_PAGE;
                    }
                } else {
                    boolean isExisted = dao.checkEmailIsExist(email);
                    if (isExisted) {
                        errors.setPasswordIncorrect("Password incorrect");
                    } else {
                        errors.setEmailNotExist("Email is not exist");
                    }
                    request.setAttribute("CREATEERROR", errors);
                }
            }
        } catch (NamingException ex) {
            logger.error("LoginServlet_Naming " + ex.getMessage());
        } catch (SQLException ex) {
            logger.error("LoginServlet_SQL " + ex.getMessage());
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
