package logon;

import java.sql.*;
import java.util.Vector;

public class LogonDBBean { //DB�� ���õ� ���� �ϴ� Ŭ���� : DBBean, DAO
	//Ŭ���� �ȿ��� ��ü�� �ѹ��� ����. getInstance()�޼���� ��ü�� �ּ� ����
	private static LogonDBBean instance = new LogonDBBean();
//	LogonDBBean m = LogonDBBean.getInstance();
	public static LogonDBBean getInstance(){
		return instance;
	}
	
	//�̱��� - �����ڿ� private �ٿ���
	private LogonDBBean(){}
	
	//Ŀ�ؼ� Ǯ���� Ŀ�ؼ� �����ͼ� ���� (�� Ŭ���� �������� ���⶧���� private�� ����)
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	/* inputPro.jsp */
	public void insertMember(LogonDataBean member) throws Exception{ //LogonDataBean ��ü�� ��Ƽ� ������.
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = getConnection();
//			DriverManager.getConnection(jdbc:apache:commons:dbcp:/pool);
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
				if(dbpasswd.equals(passwd)){
					x = 1; //id와 비밀번호가 일치할 때 
				}else{
					x = 0; //id가 다를 때
				}
			}else{
				x = -1; // 비밀번호가 다를 때 
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
		int x = -1; //����� ��
		
		try{
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select id from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x = 1; // 해당 아이디 사용불가
			}else{
				x = -1; //해당 아이디 사용가능
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
				member = new LogonDataBean(); //LogonDataBean ��ü�� ��� ����
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
			pstmt = conn.prepareStatement("update members set passwd=?, name=?, email=?, blog=?, zipcode=?, address=?" + " where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(7, member.getId());
			
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
			pstmt = conn.prepareStatement("select passwd from members where id = to_char(?)");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){ //passwd���� �����ͼ� ��
					pstmt = conn.prepareStatement("delete from members where id= to_char(?)");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; //ȸ��Ż�� ����
				}else{
					x = 0; //��й�ȣ Ʋ��
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
				vecList.addElement(tempZipcode); //���ڵ� ���� �� ZipcodeBean ��ü�� �����ϰ� �������� ��´� -> ������� vector��ü�� ��´�.
			}
		}catch(Exception ex){
			System.out.println("Exception" + ex);
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return vecList; //ZipcodeBean ��ü���� ���� vector ��ü ����
	} //end zipcodeRead()
	
	/* searchIdPro.jsp */
	public String searchId(String email, String name) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id="";
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select id from members where email=? and name=?");
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				id = rs.getString("id"); //id ã�� ����
			}else{
				id = ""; // �ش� �̸� ����.
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
	public String changePasswd(String id, String email, String name) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String cpasswd="";
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select passwd from members where id=? and email=? and name=?");
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				for(int i=0; i<6; i++){
					int x = (int)(Math.random() * 6)+1;
					cpasswd += x; //random 6�ڸ� ��й�ȣ ����
				}
				pstmt = conn.prepareStatement("update members set passwd=? where id=?");
				pstmt.setString(1, cpasswd);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}else{
				cpasswd = ""; // �ش� �̸� ����.
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
