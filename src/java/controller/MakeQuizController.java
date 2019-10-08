/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Quiz;

/**
 *
 * @author dinht
 */
public class MakeQuizController extends HttpServlet {

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
        request.getRequestDispatcher("makequiz.jsp").forward(request, response);
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
        String creater = request.getParameter("creater");
        String qusetion = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String[] answers = request.getParameterValues("answers");

        Quiz newQuiz = new Quiz();
        newQuiz.setCreater(creater);
        newQuiz.setQuestion(qusetion);
        newQuiz.setOption1(option1);
        newQuiz.setOption2(option2);
        newQuiz.setOption3(option3);
        newQuiz.setOption4(option4);
        newQuiz.setAnswers(new ArrayList(Arrays.asList(answers)));

        QuizDAO quizDAO = new QuizDAO();

        if (quizDAO.create(newQuiz)) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/makequiz.jsp");
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Save success!!!');");
            pw.println("</script>");
            rd.include(request, response);
        } else {
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('SYSTEM ERROR! CANNOT SAVE YOUR QUESTION! PLEASE TRY LATER!');");
            pw.println("</script>");
            response.sendRedirect("/OnlineQuiz/makequiz");
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
