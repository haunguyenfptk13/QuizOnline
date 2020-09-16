/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.question.QuestionDAO;
import haun.question.QuestionDTO;
import haun.subject.SubjectDAO;
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

/**
 *
 * @author msi
 */
public class StartQuizServlet extends HttpServlet {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(StartQuizServlet.class);
    private final String PAGING_SERVLET = "PagingServlet";

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

        String url = PAGING_SERVLET;
        String subjectValue = request.getParameter("cboSubject");
        try {
            if (!subjectValue.equals("")) {
                //get session
                HttpSession session = request.getSession();
                //call dao get time and numQuestion of subject
                SubjectDAO sbDao = new SubjectDAO();
                int time = sbDao.getTime(subjectValue);
                int numQuestion = sbDao.getNumQuestion(subjectValue);
                //create question of quiz and set att
                QuestionDAO dao = new QuestionDAO();
                dao.createQuiz(subjectValue, numQuestion);
                List<QuestionDTO> quizFull = dao.getQuestionList();
                if (quizFull != null) {
                    session.setAttribute("QUIZFULL", quizFull);
                }
                session.setAttribute("TIME", time);
                session.setAttribute("NUMQUESTION", numQuestion);
                session.setAttribute("SUBJECT", subjectValue);
            }
        } catch (NamingException ex) {
            logger.error("StartQuizServlet_Naming " + ex.getMessage());
        } catch (SQLException ex) {
            logger.error("StartQuizServlet_SQL " + ex.getMessage());
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
