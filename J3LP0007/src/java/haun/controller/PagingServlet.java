/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import haun.question.QuestionDAO;
import haun.question.QuestionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class PagingServlet extends HttpServlet {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PagingServlet.class);
    private final String QUIZ_PAGE = "quiz.jsp";

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

        String url = QUIZ_PAGE;
        int pageNo = Integer.parseInt(request.getParameter("txtPageNo"));
        String answer = request.getParameter("rdoAnswer");
        try {
            //get list question
            HttpSession session = request.getSession();
            // set answer into session
            if (answer != null) {
                // get questionNo
                int questionNo = Integer.parseInt(request.getParameter("questionNo"));
                // get List answer
                Map<Integer, String> answerList = (Map<Integer, String>) session.getAttribute("ANSWERLIST");
                if (answerList == null) {
                    answerList = new HashMap<>();
                }
                // save data
                answerList.put(questionNo, answer);
                session.setAttribute("ANSWERLIST", answerList);
            }
            //call DAO for paging
            QuestionDAO dao = new QuestionDAO();
            List<QuestionDTO> quizFull = (List<QuestionDTO>) session.getAttribute("QUIZFULL");
            if (quizFull != null) {
                int numQuestion = (int) session.getAttribute("NUMQUESTION");
                int recordTotal = numQuestion;
                int pageNumber = recordTotal / 1;
                if (recordTotal > (pageNumber * 1)) {
                    pageNumber += 1;
                }
                int recordOffset = (pageNo - 1) * 1;
                List<QuestionDTO> quiz = dao.getPageQuiz(recordOffset, 1, quizFull);
                // set att for 1 page
                request.setAttribute("QUIZ", quiz);
                request.setAttribute("PAGENUMBER", pageNumber);
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
