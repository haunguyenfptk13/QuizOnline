/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author msi
 */
public class DispatcherController extends HttpServlet {
    private final String LOGIN_PAGE = "login.html";
    private final String INVALID_LOGIN_PAGE = "login.jsp";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String CREATE_NEW_ACCOUNT_SERVLET = "CreateNewAccountServlet";
    private final String SEARCH_QUESTION_NAME_SERVLET = "SearchQuestionNameServlet";
    private final String CREATE_NEW_QUESTION_SERVLET = "CreateNewQuestionServlet";
    private final String DELETE_QUESTION_SERVLET = "DeleteQuestionServlet";
    private final String UPDATE_QUESTION_SERVLET = "UpdateQuestionServlet";
    private final String START_QUIZ_SERVLET = "StartQuizServlet";
    private final String PAGGING_SERVLET = "PagingServlet";
    private final String LOGOUT_SERVLET = "LogoutServlet";
    private final String FINISHED_SERVLET = "FinishedServlet";
    private final String NEXT_PAGE_SERVLET = "NextPageServlet";
    private final String PREVIOUS_PAGE_SERVLET = "PreviousPageServlet";
    private final String SEARCH_HISTORY_SERVLET = "SearchHistoryServlet";
    private final String ACTIVE_ACCOUNT_SERVLET = "ActiveAccountServlet";
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
        
        String url = null;
        String button = request.getParameter("btAction");
        try {
            if(button == null){
                url = LOGIN_PAGE;
            }else if(button.equals("Login")){
                url = LOGIN_SERVLET;
            }else if(button.equals("Create New Account")){
                url = CREATE_NEW_ACCOUNT_SERVLET;
            }else if(button.equals("Search")){
                url = SEARCH_QUESTION_NAME_SERVLET;
            }else if(button.equals("Create New Question")){
                url = CREATE_NEW_QUESTION_SERVLET;
            }else if(button.equals("delete")){
                url = DELETE_QUESTION_SERVLET;
            }else if(button.equals("Update")){
                url = UPDATE_QUESTION_SERVLET;
            }else if(button.equals("Start")){
                url = START_QUIZ_SERVLET;
            }else if(button.equals("Paging")){
                url = PAGGING_SERVLET;
            }else if(button.equals("Logout")){
                url = LOGOUT_SERVLET;
            }else if(button.equals("Finished")){
                url = FINISHED_SERVLET;
            }else if(button.equals("Next")){
                url = NEXT_PAGE_SERVLET;
            }else if(button.equals("Previous")){
                url = PREVIOUS_PAGE_SERVLET;
            }else if(button.equals("Search History")){
                url = SEARCH_HISTORY_SERVLET;
            }else if(button.equals("Active")){
                url = ACTIVE_ACCOUNT_SERVLET;
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
