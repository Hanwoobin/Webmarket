package mvc.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBconnection;
import sun.security.util.PropertyExpander.ExpandException;

public class BoardDAO {
	private static BoardDAO instance;
	
	private BoardDAO() {
	}
	
	public static BoardDAO getInstance() {
		if(instance == null) 
			instance = new BoardDAO();
		return instance;
	}
	//테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql;
		
		if (items == null && text == null) {
			sql = "select count(*) from board";
		}
		else
			sql = "select count(*) from board where" + items + "like'%"+text+"%'";
		try {
			conn = DBconnection.getConnection();
		}catch (Exception ex) {
			System.out.println("getListCount() 에러 :"+ ex);
		}finally {
			try {
				if(rs!=null) 
					rs.close();
				if (pstmt!=null)
					rs.close();
				if(conn != null)
					conn.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
				//런타임 예외는 주로 프로그램의 오류가 있을 때 발생하도록 의도된 것들이다. 이런 예외는 코드에서 미리 조건을 체크하도록 주의 깊게 만든다면 피할 수 있다. 피할 수 있지만 개발자가 부주의해서 발생할 수 있는 경우에 발생하도록 만든 것이 런타임 예외이다.
				
			}
		}
		
		
		return count;
	}
	public ArrayList<BoardDTO> getBoardList(int page, int limt,String items,String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text);
		int start = (page -1) * limt;
		int index = start +1;
		
		String sql;
		
		if(items == null & text ==null) 
			sql = "select * from board ORDER BY num DESC";
		else
			sql = "select * from board where "+items + "like '%"+ text +"%' Order by num DESC";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.absolute(index)) {//absolute 지정한(index)로 커서(위치로) 이동한다
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day("regist_day");
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				
				if(index < (start+limt)&&index <= total_record)
					index++;
				else
					break;
			}
			return list;
		}catch(Exception ex) {
			System.out.println("getboardList(에러) :" +ex);
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	//ddd
	
}
