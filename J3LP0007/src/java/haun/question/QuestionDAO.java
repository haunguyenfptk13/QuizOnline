/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.question;

import haun.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
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
public class QuestionDAO implements Serializable {

    private List<QuestionDTO> questionList;

    public List<QuestionDTO> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<QuestionDTO> questionList) {
        this.questionList = questionList;
    }

    public int getListQuestion(String searchValue, String subjectValue, int statusValue)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Open connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQLs
                String sql = "Select COUNT(id) AS Quantity "
                        + "From Question "
                        + "Where question_content Like ? and subjectID = ? and statusID = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, subjectValue);
                stm.setInt(3, statusValue);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. process
                if(rs.next()) {
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

    public List<QuestionDTO> getPageDataQuestion(String searchValue, String subjectValue, int statusValue, int offset, int next)
            throws NamingException, SQLException {
        List<QuestionDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Open connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQLs
                String sql = "Select id, question_content, answer_correct, a1, a2, a3, a4, createDate, subjectID, statusID "
                        + "From Question "
                        + "Where question_content Like ? and subjectID = ? and statusID = ? "
                        + "ORDER BY id "
                        + "OFFSET ? ROWS "
                        + "FETCH NEXT ? ROWS ONLY";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, subjectValue);
                stm.setInt(3, statusValue);
                stm.setInt(4, offset);
                stm.setInt(5, next);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    String id = rs.getString("id");
                    String question_content = rs.getString("question_content");
                    String answer_correct = rs.getString("answer_correct");
                    String a1 = rs.getString("A1");
                    String a2 = rs.getString("A2");
                    String a3 = rs.getString("A3");
                    String a4 = rs.getString("A4");
                    String createDate = rs.getString("createDate");
                    String subjectID = rs.getString("subjectID");
                    int statusID = rs.getInt("statusID");

                    QuestionDTO dto = new QuestionDTO(id, question_content, a1, a2, a3, a4, answer_correct, createDate, subjectID, statusID);
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

    public boolean createQuestion(QuestionDTO dto) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Question(id, question_content, A1, A2, A3, A4, answer_correct, createDate, subjectID, statusID)"
                        + " Values(?,?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getId());
                stm.setString(2, dto.getQuestion_content());
                stm.setString(3, dto.getA1());
                stm.setString(4, dto.getA2());
                stm.setString(5, dto.getA3());
                stm.setString(6, dto.getA4());
                stm.setString(7, dto.getAnswer_correct());
                stm.setString(8, dto.getCreateDate());
                stm.setString(9, dto.getSubjectID());
                stm.setInt(10, dto.getStatusID());

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

    public boolean deleteQuestion(String id) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Question set statusID = 2 where id = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);

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

    public boolean updateQuestion(String id, String questionContent, String a1, String a2, String a3, String a4, String answer_correct, String subjectUpdate) 
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Question set question_content = ?, A1 = ?, A2 = ?, A3 = ?, A4 = ?, answer_correct = ?, subjectID = ? where id = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, questionContent);
                stm.setString(2, a1);
                stm.setString(3, a2);
                stm.setString(4, a3);
                stm.setString(5, a4);
                stm.setString(6, answer_correct);
                stm.setString(7, subjectUpdate);
                stm.setString(8, id);
                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public void createQuiz(String subjectValue, int numQuestion)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Open connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQLs
                String sql = "SELECT TOP (?) id, question_content, A1, A2, A3, A4, "
                        + "answer_correct, createDate, subjectID, statusID "
                        + "FROM Question WHERE subjectID = ? "
                        + "ORDER BY NEWID()";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, numQuestion);
                stm.setString(2, subjectValue);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. process
                while (rs.next()) {
                    String id = rs.getString("id");
                    String question_content = rs.getString("question_content");
                    String a1 = rs.getString("A1");
                    String a2 = rs.getString("A2");
                    String a3 = rs.getString("A3");
                    String a4 = rs.getString("A4");
                    String answer_correct = rs.getString("answer_correct");
                    String createDate = rs.getString("createDate");
                    String subjectID = rs.getString("subjectID");
                    int statusID = rs.getInt("statusID");
                    
                    QuestionDTO dto = new QuestionDTO(id, question_content, a1, a2, a3, a4, answer_correct, createDate, subjectID, statusID);
                    if(questionList == null){
                        questionList = new ArrayList<>();
                    }
                    questionList.add(dto);
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
    }
    
    public List<QuestionDTO> getPageQuiz(int offset, int next, List<QuestionDTO> list){
        if(list.isEmpty()){
            list = new ArrayList<>();
        }
        if(list.size() < offset+next){
            return list.subList(offset, list.size());
        }
        return list.subList(offset, offset+next);
    }
            
}
