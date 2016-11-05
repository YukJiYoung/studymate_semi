package searchGroup;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class SearchListDAO {
	private static SearchListDAO instance = new SearchListDAO();

	public static SearchListDAO getInstance() {
		return instance;
	}

	private SearchListDAO() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}

	// list.jsp : 페이징을 위해서 전체 DB에 입력된 행의수가 필요하다...!!!
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
 
		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from group_list");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null)
				try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null)
				try { conn.close(); } catch (SQLException ex) { }
		}
		return x;
	}

	// list.jsp ==> Paging!!! DB로부터 여러행을 결과로 받는다.
	public List<SearchListDTO> getArticles(int start, int end, int bcategory) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SearchListDTO> articleList = null;
		try {
			conn = getConnection();
			String query = "";
			if(bcategory > 0){
				query = "select num,bcategory,scategory,title,host,status,introduce,duedate,recommendcount,currentnum,total,imgpath from group_list where bcategory=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, bcategory); 
			}else{
				query = "select num,bcategory,scategory,title,host,status,introduce,duedate,recommendcount,currentnum,total,imgpath from group_list";
				pstmt = conn.prepareStatement(query);
			}
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<SearchListDTO>(end);
				do {
					SearchListDTO article = new SearchListDTO();

					article.setNum(rs.getInt("num"));
					article.setBcategory(rs.getInt("bcategory"));
					article.setScategory(rs.getString("scategory"));
					article.setTitle(rs.getString("title"));
					article.setHost(rs.getString("host"));
					article.setStatus(rs.getString("status"));
					article.setIntroduce(rs.getString("introduce"));
					article.setDuedate(rs.getTimestamp("duedate"));
					article.setRecommendcount(rs.getInt("recommendcount"));
					article.setCurrentnum(rs.getInt("currentnum"));
					article.setTotal(rs.getInt("total"));
					article.setImgpath(rs.getString("imgpath"));

					articleList.add(article);
				} while (rs.next());
			}
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
		return articleList;
	}
	
}