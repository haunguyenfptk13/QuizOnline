/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.subject;

import java.io.Serializable;

/**
 *
 * @author msi
 */
public class SubjectDTO implements Serializable{
    private String subjectID;
    private String subjectName;
    private int numQuestion;
    private int time;
    
    public SubjectDTO(String subjectID, String subjectName) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
    }

    public SubjectDTO(String subjectID, String subjectName, int numQuestion, int time) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.numQuestion = numQuestion;
        this.time = time;
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
     * @return the subjectName
     */
    public String getSubjectName() {
        return subjectName;
    }

    /**
     * @param subjectName the subjectName to set
     */
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    /**
     * @return the numQuestion
     */
    public int getNumQuestion() {
        return numQuestion;
    }

    /**
     * @param numQuestion the numQuestion to set
     */
    public void setNumQuestion(int numQuestion) {
        this.numQuestion = numQuestion;
    }

    /**
     * @return the time
     */
    public int getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(int time) {
        this.time = time;
    }
    
}
