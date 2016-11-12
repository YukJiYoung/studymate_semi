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
import logon.LogonDataBean;


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
	public addDTO addGroup(addDTO group) throws Exception { // addDTO 占쏙옙체占쏙옙 占쏙옙티占� 占쏙옙占쏙옙占쏙옙.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			conn = getConnection();
			// 15媛� �빆紐� �엯�젰�븯湲�
			sql = "insert into groupInfo(groupNum, id, createDate, nowMember, groupName, maxMember, money, limitDate, meetingCount, tel, bcategorycode, scategorycode, imagepath, location, introduce, groupGoal, target) values(groupNum.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, group.getId()); // 洹몃９�옣
			pstmt.setTimestamp(2, group.getCreateDate()); // �깮�꽦�씪
			pstmt.setInt(3, 1); // �쁽�옱 洹몃９�썝
			pstmt.setString(4, group.getGroupName()); // 洹몃９ �씠由�
			pstmt.setInt(5, group.getMaxMember()); // 紐⑥쭛 �씤�썝 
			pstmt.setInt(6, group.getMoney()); // �쉶鍮�
			pstmt.setString(7, group.getLimitDate()); // 紐⑥쭛 湲곌컙
			pstmt.setInt(8, group.getMeetingCount()); // 紐⑥엫 �슂�씪
			pstmt.setString(9, group.getTel()); // 洹몃９�옣 �쟾�솕踰덊샇 
			pstmt.setInt(10, group.getBcategorycode()); // ��遺꾨쪟
			pstmt.setString(11, group.getScategorycode()); // �냼遺꾨쪟
			pstmt.setString(12, group.getImagePath()); // �씠誘몄� 寃쎈줈
			pstmt.setString(13, group.getLocation()); // �옣�냼
			pstmt.setString(14, group.getIntroduce()); // �냼媛쒓�
			pstmt.setString(15, group.getGroupGoal());
			pstmt.setString(16, group.getTarget());
		
			
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select groupnum.currval from dual");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			int num = rs.getInt("currval");
			
			pstmt = conn.prepareStatement("select * from groupinfo where groupnum=?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
			group.setGroupNum(rs.getInt("groupnum"));
			}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return group;
	} // end addGroup()
	
	/* applyPerson.jsp */
	public int applyPerson(String id, String groupNum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		String str = null;
		String[] strAry = null;
		int check = -1;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select id,person from groupinfo where groupNum=?");
			pstmt.setString(1, groupNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str = rs.getString("person");
				String cid = rs.getString("id");
				System.out.println("cid="+cid);
				strAry = str.split(",");
				if(cid.equals(id)) {
					return check; // 洹몃９�옣 �븘�씠�뵒
				}
				for(int i =0; i<strAry.length; i++) {
					if(strAry[i].equals(id)) {
						return check; // check=-1 �씠誘� �벑濡앸맂 �븘�씠�뵒 
					}  
				}
						str += ","+id;
						pstmt = conn.prepareStatement("update groupinfo set person=? where groupnum=?");
						pstmt.setString(1, str);
						pstmt.setString(2, groupNum);
						pstmt.executeUpdate();
						check = 1;
				
				
			} else {
				pstmt = conn.prepareStatement("update groupinfo set person=? where groupnum=?");
				pstmt.setString(1, id);
				pstmt.setString(2, groupNum);
				pstmt.executeUpdate();
				check = 1;
			} 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return check; // check=1 �깉濡�寃� �떊泥�紐⑸줉�뿉 異붽� 
	} // end applyPerson
	
	public int checkLeader(int groupNum, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		int check = -1;
		String cid = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from groupinfo where groupNum=?");
			pstmt.setInt(1, groupNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cid = rs.getString(1);
				if(id.equals(cid)) {
					check = 1; // �젒�냽�븳 �븘�씠�뵒媛� 洹몃９�옣�씪 寃쎌슦 1�쓣 由ы꽩
					
				} else {
					check = 0; // �젒�냽�븳 �븘�씠�뵒媛� 洹몃９�옣�씠 �븘�땶 寃쎌슦 0�쓣 由ы꽩
				}
		
			} 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return check; // check=1 �깉濡�寃� �떊泥�紐⑸줉�뿉 異붽� 
	}
	
	
	/* grouppage.jsp */
	public List<LogonDataBean> getMember(int groupNum) throws Exception{ 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;			
		String str;
		String[] strAry;
		List<LogonDataBean> memberList = null;
		try{
			conn = getConnection();	
			
			pstmt = conn.prepareStatement("select person from groupinfo where groupNum=?");
			
			pstmt.setInt(1, groupNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				str = rs.getString("person");
				strAry = str.split(",");
				memberList = new ArrayList<LogonDataBean>();
				for (int i=0; i<strAry.length; i++) {
					String id = strAry[i];
					pstmt = conn.prepareStatement("select * from members where id = to_char(?)");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						LogonDataBean member = new LogonDataBean();
						member.setName(rs.getString("name"));
						member.setGender(rs.getString("gender"));
						member.setBirthday(rs.getString("birthday"));
						member.setLocation(rs.getString("location"));
						member.setTel(rs.getString("tel"));	
						
						memberList.add(i,member);
					}
				}
			} else {
				str = "";
			
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return memberList;
	} // end

	public addDTO loadGroupDB(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		addDTO group = new addDTO();
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from groupinfo where groupNum=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
			group.setGroupNum(rs.getInt("groupnum"));
			group.setId(rs.getString("id"));
			group.setCreateDate(rs.getTimestamp("createdate"));
			group.setNowMember(rs.getInt("nowmember"));
			group.setGroupName(rs.getString("groupname"));
			group.setMaxMember(rs.getInt("maxmember"));
			group.setMoney(rs.getInt("money"));
			group.setLimitDate(rs.getString("limitdate"));
			group.setMeetingCount(rs.getInt("meetingcount"));
			group.setTel(rs.getString("tel"));
			group.setBcategorycode(rs.getInt("bcategorycode"));
			group.setScategorycode(rs.getString("scategorycode"));
			group.setImagePath(rs.getString("imagepath"));
			group.setLocation(rs.getString("location"));
			group.setIntroduce(rs.getString("introduce"));
			group.setMember(rs.getString("member"));
			group.setPerson(rs.getString("person"));
			group.setGroupGoal(rs.getString("groupgoal"));
			group.setTarget(rs.getString("target"));
		
			
			} 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return group; // check=1 �깉濡�寃� �떊泥�紐⑸줉�뿉 異붽� 
	}
	

}