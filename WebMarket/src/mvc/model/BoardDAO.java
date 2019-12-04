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
	//���̺��� ���ڵ� ����
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
			System.out.println("getListCount() ���� :"+ ex);
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
				//��Ÿ�� ���ܴ� �ַ� ���α׷��� ������ ���� �� �߻��ϵ��� �ǵ��� �͵��̴�. �̷� ���ܴ� �ڵ忡�� �̸� ������ üũ�ϵ��� ���� ��� ����ٸ� ���� �� �ִ�. ���� �� ������ �����ڰ� �������ؼ� �߻��� �� �ִ� ��쿡 �߻��ϵ��� ���� ���� ��Ÿ�� �����̴�.
				
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
			
			while (rs.absolute(index)) {//absolute ������(index)�� Ŀ��(��ġ��) �̵��Ѵ�
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
			System.out.println("getboardList(����) :" +ex);
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
