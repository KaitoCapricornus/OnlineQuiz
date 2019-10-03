/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author dinht
 */
public class RegisterController extends HttpServlet {

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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String raw_type = request.getParameter("type");
        byte type = Byte.parseByte(raw_type);
        String email = request.getParameter("email");

        Account acc = new Account();
        acc.setUsername(username);
        acc.setPassword(password);
        acc.setUser_type(type);
        acc.setEmail(email);

        AccountDAO accDAO = new AccountDAO();
        if (accDAO.create(acc)) {
            response.sendRedirect("/OnlineQuiz/login");
        }else{
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('SYSTEM ERROR! CANNOT CREATE YOUR ACCOUNT! PLEASE TRY LATER!');");
            pw.println("</script>");
            response.sendRedirect("/OnlineQuiz/register");
        }
    }

}
