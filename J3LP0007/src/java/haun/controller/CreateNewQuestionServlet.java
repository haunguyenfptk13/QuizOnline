/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.question.QuestionCreateError;
import haun.question.QuestionDAO;
import haun.question.QuestionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author msi
 */
public class CreateNewQuestionServlet extends HttpServlet {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CreateNewQuestionServlet.class);
    private final String SEARCH_PAGE = "search.jsp";
    private final String ERRORS_PAGE = "createNewQuestion.jsp";

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
        String id = request.getParameter("txtId");
        String questionContent = request.getParameter("txtQuestionContent");
        String answerA = request.getParameter("txtAnswerA");
        String answerB = request.getParameter("txtAnswerB");
        String answerC = request.getParameter("txtAnswerC");
        String answerD = request.getParameter("txtAnswerD");
        String answerCorrrect = request.getParameter("cboAnswerCorrect");
        String subjectID = request.getParameter("cboSubject");
        int statusID = Integer.parseInt(request.getParameter("cboStatus"));

        QuestionCreateError errors = new QuestionCreateError();
        boolean foundErr = false;
        try {
            if (id.trim().length() < 2 || id.trim().length() > 20) {
                foundErr = true;
                errors.setIdLengthErr("Id is required input from 2 to 20 characters");
            }
            if (questionContent.trim().length() < 6 || questionContent.trim().length() > 99) {
                foundErr = true;
                errors.setQuestionContentLengthrr("Question Content is required input from 6 to 99 characters");
            }
            if (answerA.trim().length() < 1 || answerA.trim().length() > 99) {
                foundErr = true;
                errors.setAnswerALengthErr("Answer A is required input from 1 to 99 characters");
            }
            if (answerB.trim().length() < 1 || answerB.trim().length() > 99) {
                foundErr = true;
                errors.setAnswerBLengthErr("Answer B is required input from 1 to 99 characters");
            }
            if (answerC.trim().length() < 1 || answerC.trim().length() > 99) {
                foundErr = true;
                errors.setAnswerCLengthErr("Answer C is required input from 1 to 99 characters");
            }
            if (answerD.trim().length() < 1 || answerD.trim().length() > 99) {
                foundErr = true;
                errors.setAnswerDLengthErr("Answer D is required input from 1 to 99 characters");
            }

            //proceess
            if (foundErr) {
                request.setAttribute("CREATEERROR", errors);
            } else {
                //get date
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String dateNow = sdf.format(date);
                //call DAO
                QuestionDTO dto = new QuestionDTO(id, questionContent, answerA, answerB, answerC, answerD, answerCorrrect, dateNow, subjectID, statusID);
                QuestionDAO dao = new QuestionDAO();
                boolean result = dao.createQuestion(dto);

                if (result) {
                    url = SEARCH_PAGE;
                }
            }
        } catch (NamingException ex) {
            logger.error("CreateNewQuestionServlet_Naming " + ex.getMessage());
        } catch (SQLException ex) {
            logger.error("CreateNewQuestionServlet_SQL " + ex.getMessage());
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
