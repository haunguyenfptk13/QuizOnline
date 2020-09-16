/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.quizHistory;

import haun.question.QuestionDTO;
import haun.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author msi
 */
public class QuizHistoryDAO implements Serializable {

    public boolean saveResultQuiz(String subjectID, int numCorrect, float point, String email)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Quiz_History(subjectID, number_correct, point, email)"
                        + " Values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, subjectID);
                stm.setInt(2, numCorrect);
                stm.setFloat(3, point);
                stm.setString(4, email);

                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public int getListHistory(String subjectID)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select COUNT(subjectID) AS Quantity from Quiz_History where subjectID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, subjectID);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int quantity = rs.getInt("Quantity");
                    return quantity;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public List<QuizHistoryDTO> getPageDataQuizHistory(String subjectValue, int offset, int next)
            throws NamingException, SQLException {
        List<QuizHistoryDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Open connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQLs
                String sql = "Select quizID, subjectID, number_correct, point, email "
                        + "From Quiz_History "
                        + "Where subjectID = ? "
                        + "ORDER BY quizID "
                        + "OFFSET ? ROWS "
                        + "FETCH NEXT ? ROWS ONLY";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, subjectValue);
                stm.setInt(2, offset);
                stm.setInt(3, next);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    int quizID = rs.getInt("quizID");
                    String subjectID = rs.getString("subjectID");
                    int number_correct = rs.getInt("number_correct");
                    float point = rs.getFloat("point");
                    String email = rs.getString("email");
                    
                    QuizHistoryDTO dto = new QuizHistoryDTO(quizID, subjectID, number_correct, point, email);
                    list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
}
