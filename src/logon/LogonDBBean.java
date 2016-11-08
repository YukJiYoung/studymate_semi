package logon;

import java.sql.*;
import java.util.Vector;

public class LogonDBBean { //DB占쏙옙 占쏙옙占시듸옙 占쏙옙占쏙옙 占싹댐옙 클占쏙옙占쏙옙 : DBBean, DAO
	//클占쏙옙占쏙옙 占싫울옙占쏙옙 占쏙옙체占쏙옙 占싼뱄옙占쏙옙 占쏙옙占쏙옙. getInstance()占쌨쇽옙占쏙옙占� 占쏙옙체占쏙옙 占쌍쇽옙 占쏙옙占쏙옙
	private static LogonDBBean instance = new LogonDBBean();
//	LogonDBBean m = LogonDBBean.getInstance();
	public static LogonDBBean getInstance(){
		return instance;
	}
	
	//占싱깍옙占쏙옙 - 占쏙옙占쏙옙占쌘울옙 private 占쌕울옙占쏙옙
	private LogonDBBean(){}
	
	//커占쌔쇽옙 풀占쏙옙占쏙옙 커占쌔쇽옙 占쏙옙占쏙옙占싶쇽옙 占쏙옙占쏙옙 (占쏙옙 클占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占썩때占쏙옙占쏙옙 private占쏙옙 占쏙옙占쏙옙)
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	/* inputPro.jsp */
	public void insertMember(LogonDataBean member) throws Exception{ //LogonDataBean 占쏙옙체占쏙옙 占쏙옙티占� 占쏙옙占쏙옙占쏙옙.
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into members values (?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirthday());
			pstmt.setString(6, member.getTel());
			pstmt.setTimestamp(7, member.getRegdate());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getLocation());
			pstmt.setString(10, member.getScategorycode());
			pstmt.setString(11, member.getZzimlist());
			
			System.out.println(member.getId());
			System.out.println(member.getPasswd());
			System.out.println(member.getName());
			System.out.println(member.getGender());
			System.out.println(member.getBirthday());
			System.out.println(member.getTel());
			System.out.println(member.getRegdate());
			System.out.println(member.getEmail());
			System.out.println(member.getLocation());
			System.out.println(member.getScategorycode());
			System.out.println(member.getZzimlist());
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
	} //end insertMember()
	
	/* loginPro.jsp */
	public int userCheck(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				System.out.println(dbpasswd);
				if(dbpasswd.equals(passwd)){
					x = 1; //id�� 鍮꾨�踰덊샇媛� �씪移섑븷 �븣 
				}else{
					x = 0; //id媛� �떎瑜� �븣
				}
			}else{
				x = -1; // 鍮꾨�踰덊샇媛� �떎瑜� �븣 
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	} //end userCheck()
	
	/* confirmId.jsp */
	public int confirmId(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1; //占쏙옙占쏙옙占� 占쏙옙
		
		try{
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select id from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x = 1; // �빐�떦 �븘�씠�뵒 �궗�슜遺덇�
			}else{
				x = -1; //�빐�떦 �븘�씠�뵒 �궗�슜媛��뒫
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	} //end confirmId()
	
	/* modifyForm.jsp */
	public LogonDataBean getMember(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member = new LogonDataBean(); //LogonDataBean 占쏙옙체占쏙옙 占쏙옙占� 占쏙옙占쏙옙
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return member;
	} //end getMember()
	
	/* modifyPro.jsp */
	public void updateMember(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("update members set passwd=?, name=?, gender=?, birthday=?, tel=?, regdate=?, email=?, location=?, scategorycode=?, zzimlist=?" + " where id=?");
			
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirthday());
			pstmt.setString(6, member.getTel());
			pstmt.setTimestamp(7, member.getRegdate());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getLocation());
			pstmt.setString(10, member.getScategorycode());
			pstmt.setString(11, member.getZzimlist());
			pstmt.setString(1, member.getId());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
	} //end updateMember()
	
	public int deleteMember(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){ //passwd占쏙옙占쏙옙 占쏙옙占쏙옙占싶쇽옙 占쏙옙
					pstmt = conn.prepareStatement("delete from members where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; //회占쏙옙탈占쏙옙 占쏙옙占쏙옙
				}else{
					x = 0; //占쏙옙橘占싫� 틀占쏙옙
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	} //end deleteMember()
	
	public Vector<ZipcodeBean> zipcodeRead(String area4){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipcodeBean> vecList = new Vector<ZipcodeBean>();
		
		try{
			conn = getConnection();
			String strQuery = "select * from zipcode where area4 like '" + area4 + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZipcodeBean tempZipcode = new ZipcodeBean();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				vecList.addElement(tempZipcode); //占쏙옙占쌘듸옙 占쏙옙占쏙옙 占쏙옙 ZipcodeBean 占쏙옙체占쏙옙 占쏙옙占쏙옙占싹곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙쨈占� -> 占쏙옙占쏙옙占쏙옙占� vector占쏙옙체占쏙옙 占쏙옙쨈占�.
			}
		}catch(Exception ex){
			System.out.println("Exception" + ex);
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return vecList; //ZipcodeBean 占쏙옙체占쏙옙占쏙옙 占쏙옙占쏙옙 vector 占쏙옙체 占쏙옙占쏙옙
	} //end zipcodeRead()
	
	/* searchIdPro.jsp */
	public String searchId(String name, String jumin1, String jumin2) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id="";
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id from members where name=? and jumin1=? and jumin2=?");
			pstmt.setString(1, name);
			pstmt.setString(2, jumin1);
			pstmt.setString(3, jumin2);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				id = rs.getString("id"); //id 찾占쏙옙 占쏙옙占쏙옙
			}else{
				id = ""; // 占쌔댐옙 占싱몌옙 占쏙옙占쏙옙.
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return id;
	} //end userCheck()
	
	/* changePwPro.jsp */
	public String changePasswd(String id, String name, String jumin1, String jumin2) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String cpasswd="";
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from members where id=? and name=? and jumin1=? and jumin2=?");
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, jumin1);
			pstmt.setString(4, jumin2);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				for(int i=0; i<6; i++){
					int x = (int)(Math.random() * 6)+1;
					cpasswd += x; //random 6占쌘몌옙 占쏙옙橘占싫� 占쏙옙占쏙옙
				}
				pstmt = conn.prepareStatement("update members set passwd=? where id=?");
				pstmt.setString(1, cpasswd);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}else{
				cpasswd = ""; // 占쌔댐옙 占싱몌옙 占쏙옙占쏙옙.
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return cpasswd;
	} //end userCheck()
	
} //end LogOnDBBean
