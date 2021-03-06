package customerboard;

import java.sql.*;
import java.util.*;

//BoardDBBean bd = BoardDBBean.getInstance()
public class BoardDBBean {   
    private static BoardDBBean instance = new BoardDBBean();
   
    public static BoardDBBean getInstance() {
        return instance;
    }
   
    private BoardDBBean() {
    }
   
    private Connection getConnection() throws Exception {
	String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";         
        return DriverManager.getConnection(jdbcDriver);
    }
    //writePro.jsp
    public void insertArticle(BoardDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
	ResultSet rs = null;
        //?΅λ³?κΈ??Έμ§? ?Όλ°κ??Έμ§?λ₯? κ΅¬λΆ?΄? ?? ₯?μΌμ£Ό? λ‘μ§!!!
	int qNum=article.getqNum();
	int ref=article.getRef();
	int refStep=article.getRefStep();
	int refLevel=article.getRefLevel();
	int qNumber=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(qNum) from question");
	    rs = pstmt.executeQuery();

	    if (rs.next())
	      qNumber=rs.getInt(1)+1;
	    else
	      qNumber=1;
  
	    if (qNum!=0)
	    { 
	      sql="update question set refStep=re_step+1 where ref= ? and refStep> ?";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, ref);
	      pstmt.setInt(2, refStep);
	      pstmt.executeUpdate();
	      refStep=refStep+1;
	      refLevel=refLevel+1;
	    }else{
		      ref=qNumber;
	      refStep=0;
	      refLevel=0;
	    }
            // μΏΌλ¦¬λ₯? ??±
            sql = "insert into question(qNum,qWriter,email,qTitle,passwd,qDate,";
            sql+="ref,refStep,refLevel,qContent,ip) values(question_num.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getqWriter());
            pstmt.setString(2, article.getEmail());
            pstmt.setString(3, article.getqTitle());
            pstmt.setString(4, article.getPasswd());
            pstmt.setTimestamp(5, article.getqDate());
            pstmt.setInt(6, ref);
            pstmt.setInt(7, refStep);
            pstmt.setInt(8, refLevel);
            pstmt.setString(9, article.getqContent());
            pstmt.setString(10, article.getIp());

            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
	    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
   
    //list.jsp : ??΄μ§μ ??΄? ? μ²? DB? ?? ₯? ???κ°? ????€...!!!
    public int getArticleCount() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement("select count(*) from question");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return x;
    }
    
public int getArticleCount(int n, String searchKeyword) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String[] column_name = {"qWriter","qTitle","qContent"};
		
		int x = 0;
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count (*) from question where "+column_name[n]+" like '%"+searchKeyword+"%'");
			
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

    //list.jsp ==> Paging!!! DBλ‘λ??° ?¬?¬?? κ²°κ³Όλ‘? λ°λ?€.
    public List getArticles(int start, int end) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List articleList=null;
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select qNum,qWriter,email,qTitle,passwd,qDate,ref,refstep,refLevel,qContent,ip,readcount,r  " +
            "from (select qNum,qWriter,email,qTitle,passwd,qDate,ref,refStep,refLevel,qContent,ip,readcount,rownum r " +
            "from (select qNum,qWriter,email,qTitle,passwd,qDate,ref,refStep,refLevel,qContent,ip,readcount " +
            "from question order by ref desc, refStep asc) order by ref desc, refStep asc ) where r >= ? and r <= ? ");
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList(end);
                do{
                  BoardDataBean article= new BoardDataBean();
                  article.setqNum(rs.getInt("qNum"));
                  article.setqWriter(rs.getString("qWriter"));
                  article.setEmail(rs.getString("email"));
                  article.setqTitle(rs.getString("qTitle"));
                  article.setPasswd(rs.getString("passwd"));
                  article.setqDate(rs.getTimestamp("qDate"));
                  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRefStep(rs.getInt("refStep"));
                  article.setRefLevel(rs.getInt("refLevel"));
                  article.setqContent(rs.getString("qContent"));
                  article.setIp(rs.getString("ip"));
 
                  articleList.add(article);
		}while(rs.next());
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return articleList;
    }
    
    public List getArticles(int start, int end, int n, String searchKeyword) throws Exception
   	{
   		Connection conn = null;
   		PreparedStatement pstmt = null;
   		ResultSet rs = null;
   		List articleList = null;
   		
   		String[] column_name = {"qWriter","qTitle","qContent"};
   		
   		try
   		{
   			conn = getConnection();
   			
   			String sql = "select qNum,qWriter,email,qTitle,passwd,qDate,ref,refStep,refLevel,qContent,ip,readcount,r "	
   						+ "from (select qNum,qWriter,email,qTitle,passwd,qDate,ref,refStep,refLevel,qContent,ip,readcount,rownum r "
   						+"from (select qNum,qWriter,email,qTitle,passwd,qDate,ref,refStep,refLevel,qContent,ip,readcount "
   						+"from question order by ref desc, refStep asc) where "+column_name[n]+" like '%"+searchKeyword+"%' order by ref desc, refStep asc ) where r >= ? and r <= ?";
   			
   			pstmt = conn.prepareStatement(sql);
   			pstmt.setInt(1, start);
   			pstmt.setInt(2,	end);
   			
   			rs = pstmt.executeQuery();
   			
   			if(rs.next())
   			{
   				articleList = new ArrayList(end);
   				
   				do{
   					BoardDataBean article = new BoardDataBean();
   					
   					article.setqNum(rs.getInt("qNum"));
   					article.setqWriter(rs.getString("qWriter"));
   					article.setEmail(rs.getString("email"));
   					article.setqTitle(rs.getString("qTitle"));
   					article.setPasswd(rs.getString("passwd"));
   					article.setqDate(rs.getTimestamp("qDate"));
   					article.setReadcount(rs.getInt("readcount"));
   					article.setRef(rs.getInt("ref"));
   					article.setRefStep(rs.getInt("refStep"));
   					article.setRefLevel(rs.getInt("refLevel"));
   					article.setqContent(rs.getString("qContent"));
   					article.setIp(rs.getString("ip"));
   					
   					
   					articleList.add(article);
   				}while(rs.next());
   				
   			}
   			
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
   		
   		return articleList;
   	}

    

    //read.jsp : DBλ‘λ??° ?μ€μ ?°?΄?°λ₯? κ°?? Έ?¨?€.
    public BoardDataBean getArticle(int qNum) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("update question set readcount=readcount+1 where qNum = ?");
            pstmt.setInt(1, qNum);
            pstmt.executeUpdate();
            pstmt.close();
            pstmt = conn.prepareStatement("select * from question where qNum = ?");
            pstmt.setInt(1, qNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setqNum(rs.getInt("qNum"));
                article.setqWriter(rs.getString("qWriter"));
                article.setEmail(rs.getString("email"));
                article.setqTitle(rs.getString("qTitle"));
                article.setPasswd(rs.getString("passwd"));
                article.setqDate(rs.getTimestamp("qDate"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRefStep(rs.getInt("refStep"));
                article.setRefLevel(rs.getInt("refLevel"));
                article.setqContent(rs.getString("qContent"));
                article.setIp(rs.getString("ip"));    
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return article;
    }

    //updateForm.jsp : ?? ?Ό? ?μ€μ ?°?΄?°λ₯? κ°?? Έ?¬?.
    public BoardDataBean updateGetArticle(int qNum) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select * from question where qNum = ?");
            pstmt.setInt(1, qNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setqNum(rs.getInt("qNum"));
                article.setqWriter(rs.getString("qWriter"));
                article.setEmail(rs.getString("email"));
                article.setqTitle(rs.getString("qTitle"));
                article.setPasswd(rs.getString("passwd"));
                article.setqDate(rs.getTimestamp("qDate"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRefStep(rs.getInt("refStep"));
                article.setRefLevel(rs.getInt("refLevel"));
                article.setqContent(rs.getString("qContent"));
                article.setIp(rs.getString("ip"));    
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return article;
    }

    //updatePro.jsp : ?€?  ?°?΄?°λ₯? ?? ?? λ©μ?.
    public int updateArticle(BoardDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String dbpasswd="";
        String sql="";
        int x=-1;
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement("select passwd from question where qNum = ?");
            pstmt.setInt(1, article.getqNum());
            rs = pstmt.executeQuery();
           
            if(rs.next()){
            	dbpasswd= rs.getString("passwd");
            	if(dbpasswd.equals(article.getPasswd())){
            		sql="update question set qWriter=?,email=?,qTitle=?,passwd=?";
            		sql+=",qContent=? where qNum=?";
            		pstmt = conn.prepareStatement(sql);

            		pstmt.setString(1, article.getqWriter());
            		pstmt.setString(2, article.getEmail());
            		pstmt.setString(3, article.getqTitle());
            		pstmt.setString(4, article.getPasswd());
            		pstmt.setString(5, article.getqContent());
            		pstmt.setInt(6, article.getqNum());
            		pstmt.executeUpdate();
            		x= 1;
            	}else{
            		x= 0;
            	}
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
	    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	 return x;
    }
   
    //deletePro.jsp : ?€?  ?°?΄?°λ₯? ?­? ?? λ©μ?...
    public int deleteArticle(int qNum, String passwd) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
	    conn = getConnection();

            pstmt = conn.prepareStatement(
            "select passwd from question where qNum = ?");
            pstmt.setInt(1, qNum);
            rs = pstmt.executeQuery();
           
            if(rs.next()){
		dbpasswd= rs.getString("passwd");
		if(dbpasswd.equals(passwd)){
		    pstmt = conn.prepareStatement("delete from question where qNum=?");
                    pstmt.setInt(1, qNum);
                    pstmt.executeUpdate();
		    x= 1; //κΈ??­?  ?±κ³?
		}else
		    x= 0; //λΉλ?λ²νΈ ??λ¦?
	    }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
	return x;
    }
}