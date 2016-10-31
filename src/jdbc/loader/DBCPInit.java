package jdbc.loader;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DBCPInit extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		try {
			String drivers = config.getInitParameter("jdbcdriver"); //초기화 파라미터 값 중 'jdbcdriver'라는 값을 가져와서 저장.
			//oracle.jdbc.driver.OracleDriver
			StringTokenizer st = new StringTokenizer(drivers,","); //쉼표로 구분되는 토큰. 위의 것은 하나의토큰으로 저장
			
			while (st.hasMoreTokens()) { //token이 있는지 확인.
				String jdbcDriver = st.nextToken(); //token을 꺼내와서 저장
				Class.forName(jdbcDriver);//oracle드라이버 로딩.  
				//forName("oracle.jdbc.driver.OracleDriver")으로 해줘도 되지만 수정편하게,여러 DB접속 시 따로 또 컴파일 해주지 않아도 되서 편리
			}
		
		Class.forName("org.apache.commons.dbcp.PoolingDriver"); //poolingDriver 접속 -> 커넥션 풀에 접근할 수 있음.
		
		} catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
}
