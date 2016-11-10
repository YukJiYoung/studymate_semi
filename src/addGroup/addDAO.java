package addGroup;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



import addGroup.addDTO;


public class addDAO {

	private static addDAO instance = new addDAO();

	public static addDAO getInstance() {
		return instance;
	}

	private addDAO() {
	}

	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	// addGroupPro.jsp
	public void addGroup(addDTO group) throws Exception { // addDTO °´Ã¼·Î ´ã¾Æ¼­ °¡Á®¿È.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
	
		
		String sql = "";

		try {
			conn = getConnection();
	
			// 14
			sql = "insert into groupInfo(groupNum, groupName,maxMember,money,limitDate,meetingCount,tel,bcategorycode,scategorycode,";
			sql += "groupGoal,target,imagePath,location,introduce,createDate) values(groupInfo_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, group.getGroupName());
			pstmt.setInt(2, group.getMaxMember());
			pstmt.setInt(3, group.getMoney());
			pstmt.setString(4, group.getLimitDate());
			pstmt.setString(5, group.getMeetingCount());
			pstmt.setString(6, group.getTel());
			pstmt.setInt(7, group.getBcategorycode());
			pstmt.setString(8, group.getScategorycode());
			pstmt.setString(9, group.getGroupGoal());
			pstmt.setString(10, group.getTarget());
			pstmt.setString(11, group.getImagePath());
			pstmt.setString(12, group.getLocation());
			pstmt.setString(13, group.getIntroduce());


			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
	} // end addGroup()

}