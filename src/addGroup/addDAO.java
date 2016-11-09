package addGroup;

import java.sql.*;

import java.sql.Timestamp;

public class addDAO {

	private static addDAO instance = new addDAO();

	public static addDAO getInstance() {
		return instance;
	}

	private addDAO() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	// addGroupPro.jsp
	public void addGroup(addDTO group) throws Exception { // addDTO °´Ã¼·Î ´ã¾Æ¼­ °¡Á®¿È.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int groupNum = group.getGroupNum();
		int zzimCount = group.getZzimCount();
		int maxMember = group.getMaxMember();
		int nowMember = group.getNowMember();
	
		
		String sql = "";

		try {
			conn = getConnection();
			
			 pstmt = conn.prepareStatement("select max(groupNum) from GroupInfo");
			    rs = pstmt.executeQuery();

			   

			// 14
			sql = "insert into groupInfo(groupName,maxMember,money,limitDate,possibleDay,tel,bc,sc";
			sql += "groupGoal,target,groupImage,location,introduce,createDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, group.getGroupName());
			pstmt.setInt(2, maxMember);
			pstmt.setString(3, group.getMoney());
			pstmt.setString(4, group.getLimitDate());
			pstmt.setString(5, group.getPossibleDay());
			pstmt.setString(6, group.getTel());
			pstmt.setString(7, group.getBc());
			pstmt.setString(8, group.getSc());
			pstmt.setString(9, group.getGroupGoal());
			pstmt.setString(10, group.getTarget());
			pstmt.setString(11, group.getGroupImage());
			pstmt.setString(12, group.getLocation());
			pstmt.setString(13, group.getIntroduce());
			pstmt.setTimestamp(14, group.getCreateDate());


			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
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
		}
	} // end addGroup()

}