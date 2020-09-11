package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 전체조회
	public ArrayList<BoardVo> selectAll(BoardVo boardVo) {
		BoardVo resultVO = null;
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NO, POSTER, SUBJECT, CONTENTS, LASTPOST, VIEWS, FILENAME " + " FROM board "
					+ "ORDER BY NO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new BoardVo();
				resultVO.setNo(rs.getString(1));
				resultVO.setPoster(rs.getString(2));
				resultVO.setSubject(rs.getString(3));
				resultVO.setContents(rs.getString(4));
				resultVO.setLastpost(rs.getString(5));
				resultVO.setViews(rs.getString(6));
				resultVO.setFilename(rs.getString(7));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 단건 조회
	public BoardVo selectOne(BoardVo boardVo) {
		BoardVo resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NO, POSTER, SUBJECT, CONTENTS, LASTPOST, VIEWS, FILENAME " + "FROM BOARD "
					+ "WHERE NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getNo());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultVO = new BoardVo();
				resultVO.setNo(rs.getString(1));
				resultVO.setPoster(rs.getString(2));
				resultVO.setSubject(rs.getString(3));
				resultVO.setContents(rs.getString(4));
				resultVO.setLastpost(rs.getString(5));
				resultVO.setViews(rs.getString(6));
				resultVO.setFilename(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}

	// 삭제
	public void delete(BoardVo boardVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM BOARD WHERE NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getNo());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}

	// 수정
	public void update(BoardVo boardVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE BOARD SET SUBJECT = ? WHERE NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getSubject());
			pstmt.setString(2, boardVo.getNo());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}

	// 삽입
	public void insert(BoardVo boardVo) {
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "SELECT NO FROM SEQ WHERE TABLENAME ='board'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			
			seqSql = "UPDATE SEQ SET NO = NO + 1 WHERE TABLENAME = 'board'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);

			String sql = "INSERT INTO BOARD VALUES (?,?,?,?,SYSDATE,0,?)";
			// 디비별로 insert하는게 다름 그래서 시퀀스 처럼 쓰이는 테이블을 만들고 거기서 값을 가져온후 그 테이블에 값을 1씩 증가 시킴
			//프로시저 사용하는게 좋음
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, boardVo.getPoster());
			pstmt.setString(3, boardVo.getSubject());
			pstmt.setString(4, boardVo.getContents());
			pstmt.setString(5, boardVo.getFilename());
			int r = pstmt.executeUpdate();
			conn.commit();
			System.out.println(r + "건이 처리됨.");
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}