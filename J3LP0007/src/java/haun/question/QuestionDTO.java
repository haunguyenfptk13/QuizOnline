/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.question;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author msi
 */
public class QuestionDTO implements Serializable{
    private String id;
    private String question_content;
    private String a1;
    private String a2;
    private String a3;
    private String a4;
    private String answer_correct;
    private String createDate;
    private String subjectID;
    private int statusID;

    public QuestionDTO(String id, String question_content, String answer_correct, String createDate, String subjectID, int statusID) {
        this.question_content = question_content;
        this.answer_correct = answer_correct;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.statusID = statusID;
        this.id = id;
    }

    public QuestionDTO(String id, String question_content, String a1, String a2, String a3, String a4, String answer_correct, String createDate, String subjectID, int statusID) {
        this.id = id;
        this.question_content = question_content;
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.answer_correct = answer_correct;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.statusID = statusID;
    }


    
    

    public QuestionDTO() {
    }


    /**
     * @return the question_content
     */
    public String getQuestion_content() {
        return question_content;
    }

    /**
     * @param question_content the question_content to set
     */
    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    /**
     * @return the answer_correct
     */
    public String getAnswer_correct() {
        return answer_correct;
    }

    /**
     * @param answer_correct the answer_correct to set
     */
    public void setAnswer_correct(String answer_correct) {
        this.answer_correct = answer_correct;
    }


    /**
     * @return the createDate
     */
    public String getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
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
     * @return the statusID
     */
    public int getStatusID() {
        return statusID;
    }

    /**
     * @param statusID the statusID to set
     */
    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    /**
     * @return the a1
     */
    public String getA1() {
        return a1;
    }

    /**
     * @param a1 the a1 to set
     */
    public void setA1(String a1) {
        this.a1 = a1;
    }

    /**
     * @return the a2
     */
    public String getA2() {
        return a2;
    }

    /**
     * @param a2 the a2 to set
     */
    public void setA2(String a2) {
        this.a2 = a2;
    }

    /**
     * @return the a3
     */
    public String getA3() {
        return a3;
    }

    /**
     * @param a3 the a3 to set
     */
    public void setA3(String a3) {
        this.a3 = a3;
    }

    /**
     * @return the a4
     */
    public String getA4() {
        return a4;
    }

    /**
     * @param a4 the a4 to set
     */
    public void setA4(String a4) {
        this.a4 = a4;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    
    
}
