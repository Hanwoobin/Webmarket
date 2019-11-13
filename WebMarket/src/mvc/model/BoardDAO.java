package mvc.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBconnection;

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
	public int getListCount() {
		return (Integer)null;
	}
	public ArrayList<BoardDTO> getBoardList(int page, int limt,String items,String text) {
		BoardDTO board = new 
		
	}
	
}
