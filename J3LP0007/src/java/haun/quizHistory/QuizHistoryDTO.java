/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.quizHistory;

import java.io.Serializable;

/**
 *
 * @author msi
 */
public class QuizHistoryDTO implements Serializable{
    private int quizID;
    private String subjectID;
    private int number_correct;
    private float point;
    private String email;

    public QuizHistoryDTO(int quizID, String subjectID, int number_correct, float point, String email) {
        this.quizID = quizID;
        this.subjectID = subjectID;
        this.number_correct = number_correct;
        this.point = point;
        this.email = email;
    }

    /**
     * @return the quizID
     */
    public int getQuizID() {
        return quizID;
    }

    /**
     * @param quizID the quizID to set
     */
    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    /**
     * @return the subjectID
     */
    public String getSubjectID() {
        return subjectID;
    }

    /**
     * @param subjectID the subjectID to set
     */
    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    /**
     * @return the number_correct
     */
    public int getNumber_correct() {
        return number_correct;
    }

    /**
     * @param number_correct the number_correct to set
     */
    public void setNumber_correct(int number_correct) {
        this.number_correct = number_correct;
    }

    /**
     * @return the point
     */
    public float getPoint() {
        return point;
    }

    /**
     * @param point the point to set
     */
    public void setPoint(float point) {
        this.point = point;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
}
