package searchGroup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	/* searchGroup.jsp ==> 전체글 수 */
	public int getArticleCount(int bcategory, String[] searchCategory, int searchMembers, int searchMeetcount, int searchRegdate, String searchKeyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
 
		int x = 0;

		try {
			conn = getConnection();
			
			query += "select count(*) from groupinfo where bcategorycode="+bcategory;
			if(searchMembers == 6){
				query += " or maxMember>="+searchMembers;
			}else{
				query += " or maxMember<="+searchMembers;
			}
			if(searchMeetcount == 4 || searchMeetcount == 0){
				query += " or meetingCount="+searchMeetcount;
			}else{
				query += " or meetingCount>="+searchMeetcount;
			}
			if(searchRegdate > 0){
				query += " or createDate between (sysdate-"+searchRegdate+") and sysdate";
			}
			if(searchCategory.length > 0){
				for(String scategory : searchCategory){
					query += " or scategorycode like '%"+scategory+"%'";
				}
			}
			if(!searchKeyword.equals("")){
				query += " or bcategorycode=(select bcategorycode from bcategory where bcategoryname like '%"+searchKeyword+"%')";
				query += " or scategorycode like '%"+searchKeyword+"%'";
				query += " or groupName like '%"+searchKeyword+"%'";
				query += " or introduce like '%"+searchKeyword+"%'";
			}
//			System.out.println(query); //쿼리문 출력
			
			pstmt = conn.prepareStatement(query);
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
	/* main.jsp ==> bigCategory별 글 수 */
	public int getArticleCount(int bcategory) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
 
		int x = 0;

		try {
			conn = getConnection();
			
			query += "select count(*) from groupinfo where bcategorycode="+bcategory;
			
			pstmt = conn.prepareStatement(query);
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
	/* main.jsp -> searchGroup.jsp ==> 검색어 결과 수 */
	public int getArticleCount(int n, String searchKeyword) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String[] column_name = {"scategorycode","groupName","location"};
		
		int x = 0;
		
		try
		{
			conn = getConnection();
			if(n == 0){
				pstmt = conn.prepareStatement("select count (*) from groupinfo where scategorycode like '%"+searchKeyword+"%' or bcategorycode=(select bcategorycode from bcategory where bcategoryname like '%"+searchKeyword+"%')");
			}else{
				pstmt = conn.prepareStatement("select count (*) from groupinfo where "+column_name[n]+" like '%"+searchKeyword+"%'");
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(rs != null) try {rs.close();} catch(SQLException ex){}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();} catch(SQLException ex){}
		}
		return x;
	}

	/* searchGroup.jsp ==> bigCategory 기준  */
	public List<SearchListDTO> getArticles(int start, int end, int bcategory) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List<SearchListDTO> articleList = null;
		try {
			conn = getConnection();
			query = "select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,r "
					+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,rownum r "
					+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode from groupinfo where bcategorycode=?"
					+ ") order by createDate desc) where r >= ? and r <= ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bcategory);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<SearchListDTO>(end);
				do {
					SearchListDTO article = new SearchListDTO();

					article.setGroupNum(rs.getInt("groupNum"));
					article.setBcategorycode(rs.getInt("bcategorycode"));
					article.setScategorycode(rs.getString("scategorycode"));
					article.setGroupName(rs.getString("groupName"));
					article.setId(rs.getString("id"));
					article.setIntroduce(rs.getString("introduce"));
					article.setCreateDate(rs.getTimestamp("createDate"));
					article.setZzimCount(rs.getInt("zzimCount"));
					article.setNowMember(rs.getInt("nowMember"));
					article.setMaxMember(rs.getInt("maxMember"));
					article.setImagePath(rs.getString("imagePath"));
					article.setMeetingCount(rs.getInt("meetingCount"));
					article.setLocation(rs.getString("location"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		return articleList;
	}
	/* searchGroup.jsp ==> 검색창 */
	public List<SearchListDTO> getArticles(int start, int end, int bcategory, String[] searchCategory, int searchMembers, int searchMeetcount, int searchRegdate, String searchKeyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List<SearchListDTO> articleList = null;
		try {
			conn = getConnection();
			
			query += "select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,r";
			query += " from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,rownum r";
			query += " from groupinfo where bcategorycode="+bcategory;
			if(searchMembers == 0){
				query += " or maxMember="+searchMembers;
			}else if(searchMembers == 6){
				query += " or maxMember>="+searchMembers;
			}else{
				query += " or maxMember<="+searchMembers;
			}
			if(searchMeetcount == 0 || searchMeetcount == 4){
				query += " or meetingCount="+searchMeetcount;
			}else{
				query += " or meetingCount>="+searchMeetcount;
			}
			if(searchRegdate > 0){
				query += " or createDate between (sysdate-"+searchRegdate+") and sysdate";
			}
			if(searchCategory.length > 0){
				for(String scategory : searchCategory){
					query += " or scategorycode like '%"+scategory+"%'";
				}
			}
			if(!searchKeyword.equals("")){
				query += " or bcategorycode=(select bcategorycode from bcategory where bcategoryname like '%"+searchKeyword+"%')";
				query += " or scategorycode like '%"+searchKeyword+"%'";
				query += " or groupName like '%"+searchKeyword+"%'";
				query += " or introduce like '%"+searchKeyword+"%'";
			}
			query += " order by createDate desc) where r >= ? and r <= ?";
//			System.out.println(query); //쿼리문 출력
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleList = new ArrayList<SearchListDTO>(end);
				do {
					SearchListDTO article = new SearchListDTO();
					
					article.setGroupNum(rs.getInt("groupNum"));
					article.setBcategorycode(rs.getInt("bcategorycode"));
					article.setScategorycode(rs.getString("scategorycode"));
					article.setGroupName(rs.getString("groupName"));
					article.setId(rs.getString("id"));
					article.setIntroduce(rs.getString("introduce"));
					article.setCreateDate(rs.getTimestamp("createDate"));
					article.setZzimCount(rs.getInt("zzimCount"));
					article.setNowMember(rs.getInt("nowMember"));
					article.setMaxMember(rs.getInt("maxMember"));
					article.setImagePath(rs.getString("imagePath"));
					article.setMeetingCount(rs.getInt("meetingCount"));
					article.setLocation(rs.getString("location"));
					
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		return articleList;
	}
	
	/* main.jsp ==> bigCategory 기준 */
	public List<SearchListDTO> getArticles(int bcategory)  throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List<SearchListDTO> articleList = null;
		try {
			conn = getConnection();
			query = "select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,r "
					+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,rownum r "
					+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode from groupinfo where bcategorycode=?"
					+ ") order by createDate desc) where r <= 5";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bcategory);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<SearchListDTO>(5);
				do {
					SearchListDTO article = new SearchListDTO();

					article.setGroupNum(rs.getInt("groupNum"));
					article.setBcategorycode(rs.getInt("bcategorycode"));
					article.setScategorycode(rs.getString("scategorycode"));
					article.setGroupName(rs.getString("groupName"));
					article.setId(rs.getString("id"));
					article.setIntroduce(rs.getString("introduce"));
					article.setCreateDate(rs.getTimestamp("createDate"));
					article.setZzimCount(rs.getInt("zzimCount"));
					article.setNowMember(rs.getInt("nowMember"));
					article.setMaxMember(rs.getInt("maxMember"));
					article.setImagePath(rs.getString("imagePath"));
					article.setMeetingCount(rs.getInt("meetingCount"));
					article.setLocation(rs.getString("location"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		return articleList;
	}
	/* main.jsp ==>  */
	public List<SearchListDTO> getArticles(int start, int end, int n, String searchKeyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List<SearchListDTO> articleList = null;
		String[] column_name = {"scategorycode","groupName","location"};
		
		try {
			conn = getConnection();
			
			if(n == 0){
				query = "select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,r "
						+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,rownum r "
						+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode from groupinfo where scategorycode like '%"+searchKeyword+"%' or bcategorycode=(select bcategorycode from bcategory where bcategoryname like '%"+searchKeyword+"%')"
						+ ") order by createDate desc) where r >= ? and r <= ?";
			}else{
				query = "select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,r "
						+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode,rownum r "
						+ "from (select groupNum,id,groupName,imagePath,createDate,zzimCount,maxMember,nowMember,limitDate,meetingCount,location,introduce,bcategorycode,scategorycode from groupinfo where "+column_name[n]+" like '%"+searchKeyword+"%'"
						+ ") order by createDate desc) where r >= ? and r <= ?";
			}
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<SearchListDTO>(5);
				do {
					SearchListDTO article = new SearchListDTO();

					article.setGroupNum(rs.getInt("groupNum"));
					article.setBcategorycode(rs.getInt("bcategorycode"));
					article.setScategorycode(rs.getString("scategorycode"));
					article.setGroupName(rs.getString("groupName"));
					article.setId(rs.getString("id"));
					article.setIntroduce(rs.getString("introduce"));
					article.setCreateDate(rs.getTimestamp("createDate"));
					article.setZzimCount(rs.getInt("zzimCount"));
					article.setNowMember(rs.getInt("nowMember"));
					article.setMaxMember(rs.getInt("maxMember"));
					article.setImagePath(rs.getString("imagePath"));
					article.setMeetingCount(rs.getInt("meetingCount"));
					article.setLocation(rs.getString("location"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		return articleList;
	}
	
}