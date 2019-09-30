/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quiz;

/**
 *
 * @author dinht
 */
public class QuizDAO extends BaseDAO<Quiz> {

    @Override
    public ArrayList<Quiz> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Quiz get(String agr) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<Quiz> getAllQuizByCreater(String creater) {
        try {
            List<Quiz> quizs = new ArrayList();
            String sql = "select * from Quiz where creater = ? order by createdDate desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, creater);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizID(rs.getInt("quiz_id"));
                quiz.setCreater(creater);
                quiz.setQuestion(rs.getString("question"));
                quiz.setOption1(rs.getString("option_1"));
                quiz.setOption2(rs.getString("option_2"));
                quiz.setOption3(rs.getString("option_3"));
                quiz.setOption4(rs.getString("option_4"));
                SimpleDateFormat dfm = new SimpleDateFormat("dd MMM yyyy - hh:mm a");
                String createdDate = dfm.format(rs.getDate("createdDate"));
                quiz.setCreatedDate(createdDate);

                List<String> answers = new ArrayList();
                String sqlAnswer = "select * from Quiz_Ans where quiz_id = ?";
                PreparedStatement statementAnswer = connection.prepareStatement(sqlAnswer);
                statementAnswer.setInt(1, quiz.getQuizID());
                ResultSet rsAns = statementAnswer.executeQuery();
                while(rsAns.next()){
                    answers.add(rsAns.getString("answer"));
                }
                quiz.setAnswers(answers);
                quizs.add(quiz);
            }
            return quizs;
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean create(Quiz model) {
        try {
            String sqlQusetion = "insert into Quiz(creater, question, option_1, option_2, option_3, option_4)\n"
                    + "values (?, ?, ?, ?, ?, ?)\n";
            PreparedStatement statmentQuestion = connection.prepareStatement(sqlQusetion);
            statmentQuestion.setString(1, model.getCreater());
            statmentQuestion.setString(2, model.getQuestion());
            statmentQuestion.setString(3, model.getOption1());
            statmentQuestion.setString(4, model.getOption2());
            statmentQuestion.setString(5, model.getOption3());
            statmentQuestion.setString(6, model.getOption4());
            statmentQuestion.execute();
            for (String answer : model.getAnswers()) {
                String sqlAnswer = "insert into Quiz_Ans\n"
                        + "values ((select top 1 quiz_id from Quiz order by createdDate desc), ?)";
                PreparedStatement statmentAnswer = connection.prepareStatement(sqlAnswer);
                statmentAnswer.setString(1, answer);
                statmentAnswer.execute();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Quiz model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Quiz model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
