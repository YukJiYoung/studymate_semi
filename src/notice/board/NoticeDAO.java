package notice.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance(){
		return instance;
	}
	
	private NoticeDAO(){}
	
	private Connection getConnection() throws Exception {
		String jdbcdriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcdriver);
	}
	
	/* whitePro.jsp */
	public void insertArticle(NoticeDTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			conn = getConnection();
			sql = "insert into notice(noticeNum,noticeTitle,writer,content,noticeDate) values(notice_num.NEXTVAL,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getNoticeTitle());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getContent());
			pstmt.setTimestamp(4, article.getNoticeDate());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException e){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e){}
			if(conn != null) try {conn.close();}catch(SQLException e){}
		}
	} //end insertArticle()
	
	/* list.jsp : 페이징을 위해 DB에 입력된 전체 글 수 구하기 */
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x = rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException e){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e){}
			if(conn != null) try {conn.close();}catch(SQLException e){}
		}
		return x;
	} //end getArticleCount()
	
	/* list.jsp : 페이징. DB로부터 여러행을 결과로 받는다. */
	public List<NoticeDTO> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeDTO> articleList = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(
		            "select noticeNum,noticeTitle,writer,content,noticeDate,ncount,r " +
		            "from (select noticeNum,noticeTitle,writer,content,noticeDate,ncount,rownum r " +
		            "from notice order by noticeDate desc) where r >= ? and r <= ? ");
		    
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				articleList = new ArrayList<NoticeDTO>(end);
				do{
					NoticeDTO article = new NoticeDTO();
					article.setNoticeNum(rs.getInt("noticeNum"));
					article.setNoticeTitle(rs.getString("noticeTitle"));
					article.setWriter(rs.getString("writer"));
					article.setContent(rs.getString("content"));
					article.setNoticeDate(rs.getTimestamp("noticeDate"));
					article.setNcount(rs.getInt("ncount"));
					
					articleList.add(article);
				}while(rs.next());
			} //end if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException e){}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e){}
			if(conn != null) try {conn.close();}catch(SQLException e){}
		}
		return articleList;
	} //end getArticles()
	
	/* read.jsp : DB로부터 한줄의 데이터를 가져온다. */
	public NoticeDTO getArticle(int noticeNum) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticeDTO article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("update notice set ncount=ncount+1 where noticeNum = ?");
            pstmt.setInt(1, noticeNum);
            pstmt.executeUpdate();

	        pstmt = conn.prepareStatement("select * from notice where noticeNum = ?");
	        pstmt.setInt(1, noticeNum);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            article = new NoticeDTO();
	            article.setNoticeNum(rs.getInt("noticeNum"));
				article.setNoticeTitle(rs.getString("noticeTitle"));
				article.setWriter(rs.getString("writer"));
				article.setContent(rs.getString("content"));
				article.setNoticeDate(rs.getTimestamp("noticeDate"));
				article.setNcount(rs.getInt("ncount"));
		    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return article;	
	} //end getArticle()
	
	/* updateForm.jsp : 수정폼에 한줄의 데이터를 가져올때. */
	public NoticeDTO updateGetArticle(int noticeNum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDTO article = null;
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from notice where noticeNum = ?");
	        pstmt.setInt(1, noticeNum);
	        rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            article = new NoticeDTO();
	            article.setNoticeNum(rs.getInt("noticeNum"));
				article.setNoticeTitle(rs.getString("noticeTitle"));
				article.setWriter(rs.getString("writer"));
				article.setContent(rs.getString("content"));
				article.setNoticeDate(rs.getTimestamp("noticeDate"));
				article.setNcount(rs.getInt("ncount")); 
		    } //end if
		}catch(Exception e) {
            e.printStackTrace();
        }finally{
            if (rs != null) try { rs.close(); } catch(SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }
		return article;
	} //end updateGetArticle()
	
	/* updatePro.jsp : 실제 DB데이터 수정 */
	public int updateArticle(NoticeDTO article, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from members where id='admin'");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					sql = "update notice set noticeTitle=?,content=? where noticeNum=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, article.getNoticeTitle());
					pstmt.setString(2, article.getContent());
					pstmt.setInt(3, article.getNoticeNum());
					pstmt.executeUpdate();
					x = 1;
				}else{
					x = 0;
				} //end if
			} //end if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return x;
	} //end updateArticle()
	
	/* deletePro.jsp : 실제 DB데이터 삭제 */
	public int deleteArticle(int noticeNum, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from members where id='admin'");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from notice where noticeNum = ?");
					pstmt.setInt(1, noticeNum);
					pstmt.executeUpdate();
					x = 1; //글삭제 성공
				}else{
					x = 0; //비밀번호 틀림
				} //end if
			} //end if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return x;
	} //end deleteArticle()
}
