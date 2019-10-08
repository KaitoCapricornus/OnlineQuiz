/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quiz;

/**
 *
 * @author dinht
 */
public class TakeNumberOfQuestionController extends HttpServlet {

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
        request.getRequestDispatcher("take_number_of_question.jsp").forward(request, response);
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
        String rawNoQuestion = request.getParameter("NoQuestion");
        int noQuestion;
        try {
            noQuestion = Integer.parseInt(rawNoQuestion);
        } catch (NumberFormatException e) {
            noQuestion = 0;
        }
        if (noQuestion <= 0) {
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Number of question must be a possitive number!!!');");
            pw.println("</script>");
            request.getRequestDispatcher("take_number_of_question.jsp").include(request, response);
        } else {
            request.getSession(false).setAttribute("noQuestion", noQuestion);
            QuizDAO quizDAO = new QuizDAO();
            List<Quiz> quizs = quizDAO.getNumberOfQuiz(noQuestion);
            request.getSession(false).setAttribute("quizs", quizs);
            request.getSession().setMaxInactiveInterval(90 * noQuestion);
            request.getRequestDispatcher("takequiz.jsp").forward(request, response);
        }
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
