/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.registration;

import java.io.Serializable;

/**
 *
 * @author msi
 */
public class RegistrationCreateError {
    private String emailLengthErr;
    private String passwordLengthErr;
    private String confirmNotMatchPassword;
    private String fullNameLengthErr;
    private String emailIsExist;
    private String emailInvalid;
    private String passwordIncorrect;
    private String emailNotExist;

    public RegistrationCreateError() {
    }

    /**
     * @return the emailLengthErr
     */
    public String getEmailLengthErr() {
        return emailLengthErr;
    }

    /**
     * @param emailLengthErr the emailLengthErr to set
     */
    public void setEmailLengthErr(String emailLengthErr) {
        this.emailLengthErr = emailLengthErr;
    }

    /**
     * @return the passwordLengthErr
     */
    public String getPasswordLengthErr() {
        return passwordLengthErr;
    }

    /**
     * @param passwordLengthErr the passwordLengthErr to set
     */
    public void setPasswordLengthErr(String passwordLengthErr) {
        this.passwordLengthErr = passwordLengthErr;
    }

    /**
     * @return the confirmNotMatchPassword
     */
    public String getConfirmNotMatchPassword() {
        return confirmNotMatchPassword;
    }

    /**
     * @param confirmNotMatchPassword the confirmNotMatchPassword to set
     */
    public void setConfirmNotMatchPassword(String confirmNotMatchPassword) {
        this.confirmNotMatchPassword = confirmNotMatchPassword;
    }

    /**
     * @return the fullNameLengthErr
     */
    public String getFullNameLengthErr() {
        return fullNameLengthErr;
    }

    /**
     * @param fullNameLengthErr the fullNameLengthErr to set
     */
    public void setFullNameLengthErr(String fullNameLengthErr) {
        this.fullNameLengthErr = fullNameLengthErr;
    }

    /**
     * @return the emailIsExist
     */
    public String getEmailIsExist() {
        return emailIsExist;
    }

    /**
     * @param emailIsExist the emailIsExist to set
     */
    public void setEmailIsExist(String emailIsExist) {
        this.emailIsExist = emailIsExist;
    }

    /**
     * @return the emailInvalid
     */
    public String getEmailInvalid() {
        return emailInvalid;
    }

    /**
     * @param emailInvalid the emailInvalid to set
     */
    public void setEmailInvalid(String emailInvalid) {
        this.emailInvalid = emailInvalid;
    }

    /**
     * @return the passwordIncorrect
     */
    public String getPasswordIncorrect() {
        return passwordIncorrect;
    }

    /**
     * @param passwordIncorrect the passwordIncorrect to set
     */
    public void setPasswordIncorrect(String passwordIncorrect) {
        this.passwordIncorrect = passwordIncorrect;
    }

    /**
     * @return the emailNotExist
     */
    public String getEmailNotExist() {
        return emailNotExist;
    }

    /**
     * @param emailNotExist the emailNotExist to set
     */
    public void setEmailNotExist(String emailNotExist) {
        this.emailNotExist = emailNotExist;
    }
    
    
}
