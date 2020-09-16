/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haun.status;

import haun.utils.DBHelper;
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
public class StatusDAO {
        List<StatusDTO> statusList;

    public List<StatusDTO> getStatusList() {
        return statusList;
    }
    
    public void getListStatus()
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Open connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQLs
                String sql = "Select statusID, statusName from Status";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. process
                while(rs.next()) {
                    int statusID = rs.getInt("statusID");
                    String statusName = rs.getString("statusName");
                    
                    StatusDTO dto = new StatusDTO(statusID, statusName);
                    
                    if(statusList == null){
                        statusList = new ArrayList<>();
                    }
                    
                    statusList.add(dto);
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
    
}
