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
import java.sql.SQLException;
import java.util.List;
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
public class SearchQuestionNameServlet extends HttpServlet {
    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(SearchQuestionNameServlet.class);
    private final String SEARCH_PAGE = "search.jsp";
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
        
        String url = SEARCH_PAGE;
        String searchValue = request.getParameter("txtSearchValue");
        String subjectValue = request.getParameter("cboSubject");
        int statusValue = Integer.parseInt(request.getParameter("cboStatus"));
        int pageNo = Integer.parseInt(request.getParameter("txtPageNo"));
        try {
            if(!searchValue.equals("")){
                QuestionDAO dao = new QuestionDAO();              
                int recordTotal = dao.getListQuestion(searchValue, subjectValue, statusValue);
                int recordPage = 20;
                int pageNumber = recordTotal / recordPage;
                if(recordTotal > (pageNumber * recordPage)){
                    pageNumber += 1;
                }
                int recordOffset = (pageNo - 1) * recordPage;
                // call DAO
                List<QuestionDTO> pageList = dao.getPageDataQuestion(searchValue, subjectValue, statusValue, recordOffset, recordPage);
                request.setAttribute("SEARCHRESULT", pageList);
                request.setAttribute("PAGENUMBER", pageNumber);
            }
        } catch (NamingException ex) {
            logger.error("SearchQuestionNameServlet_Naming " + ex.getMessage());
        } catch (SQLException ex) {
            logger.error("SearchQuestionNameServlet_SQL " + ex.getMessage());
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
