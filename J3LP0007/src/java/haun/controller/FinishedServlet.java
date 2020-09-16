/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.question.QuestionDTO;
import haun.quizHistory.QuizHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class FinishedServlet extends HttpServlet {
    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(FinishedServlet.class);
    private final String QUIZ_DETAIL_PAGE = "quizDetail.jsp";
    private final String ERRORS_PAGE = "errors.jsp";

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
        int numberCorrect = 0;
        float score = 0;
        int numQuestion = 0;
        try {
            //get session
            HttpSession session = request.getSession();
            //set answer dang o page hien tai
            String rdoAnswer = request.getParameter("rdoAnswer");
            if (rdoAnswer != null) {
                // get questionNo
                int questionNo = Integer.parseInt(request.getParameter("pageNoValue"));
                // get List answer
                Map<Integer, String> answerList = (Map<Integer, String>) session.getAttribute("ANSWERLIST");
                if (answerList == null) {
                    answerList = new HashMap<>();
                }
                // save data
                answerList.put(questionNo, rdoAnswer);
                session.setAttribute("ANSWERLIST", answerList);
            }
            // get list question
            List<QuestionDTO> questionList = (List<QuestionDTO>) session.getAttribute("QUIZFULL");
            Map<Integer, String> answerList = (Map<Integer, String>) session.getAttribute("ANSWERLIST");
            for (int i = 0; i < questionList.size(); i++) {
                String answer = answerList.get(i + 1);
                System.out.println("FinishedServlet_" + answer + "_" + questionList.get(i).getAnswer_correct());
                // check answer
                if (questionList.get(i).getAnswer_correct().equalsIgnoreCase(answer)) {
                    numberCorrect += 1;
                }
            }
            // calculate score 
            numQuestion = (int) session.getAttribute("NUMQUESTION");
            score = (float) ((float) numberCorrect / numQuestion) * 10;
            request.setAttribute("SCORE", score);
            request.setAttribute("NUMBERCORRECT", numberCorrect);
            
            //save result quiz into db 
            String email = (String) session.getAttribute("EMAIL");
            String subject = (String) session.getAttribute("SUBJECT");
            QuizHistoryDAO qhDao = new QuizHistoryDAO();
            boolean result = qhDao.saveResultQuiz(subject, numberCorrect, score, email);
            if(result){
                session.removeAttribute("ANSWERLIST");                
                url = QUIZ_DETAIL_PAGE;
            }
        } catch (NamingException ex) {
            logger.error("FinishedServlet_Naming " + ex.getMessage());
        } catch (SQLException ex) {
            logger.error("FinishedServlet_SQL " + ex.getMessage());
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
