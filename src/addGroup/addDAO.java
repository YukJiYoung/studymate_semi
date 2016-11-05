package addGroup;

import java.sql.*;

import java.sql.Timestamp;



public class addDAO {
	  
	    private static addDAO instance = new addDAO();
	   
	    public static addDAO getInstance() {
	        return instance;
	    }
	   
	    private addDAO() { }
	    
	    private Connection getConnection() throws Exception {
	    	String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";         
	            return DriverManager.getConnection(jdbcDriver);
	        }
	   
	    
	  //addGroupPro.jsp
	    public void addGroup(addDTO group) throws Exception{ //addDTO °´Ã¼·Î ´ã¾Æ¼­ °¡Á®¿È.
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try{
				conn = getConnection();
//				DriverManager.getConnection(jdbc:apache:commons:dbcp:/pool);
				pstmt = conn.prepareStatement("insert into groupInfo values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, group.getGroupName());
				pstmt.setString(2, group.getMaxMember());
				pstmt.setString(3, group.getMoney());
				pstmt.setString(4, group.getLimitDate());
				pstmt.setString(5, group.getTel());
				pstmt.setString(6, group.getBcategorycode());
				pstmt.setString(7, group.getScategorycode());
				pstmt.setString(8, group.getRegQuestion());
				pstmt.setString(9, group.getGroupGoal());
				pstmt.setString(10, group.getTarget());
				pstmt.setString(11, group.getImagePath());
				pstmt.setString(12, group.getLocation());
				pstmt.setString(13, group.getIntroduce());
				
				pstmt.setString(14, group.getGroupNum());
				pstmt.setString(15, group.getId());
				pstmt.setTimestamp(16, group.getCreateDate());
				pstmt.setString(17, group.getZzimCount());
				pstmt.setString(18, group.getNowMember());




				
				
				pstmt.executeUpdate();
			}catch(Exception ex){
				ex.printStackTrace();
			}finally{
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
				if(conn != null) try {conn.close();} catch(SQLException ex){}
			}
		} //end addGroup()
	    
	    
	   
	    
	    
	    
	 

}