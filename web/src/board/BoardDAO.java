package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectionManager;


public class BoardDAO {
   Connection conn;
   PreparedStatement pstmt;
   ResultSet rs = null;

   // 전체조회
   public ArrayList<BoardVo> selectAll() {
      BoardVo resultVO = null;
      ArrayList<BoardVo> list = new ArrayList<BoardVo>();
      try {
         conn = ConnectionManager.getConnnect();
         String sql = "SELECT NO, POSTER, SUBJECT, CONTENTS, LASTPOST, VIEWS, FILENAME " + "FROM DEPARTMETNS "
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
         String sql = "SELECT NO, POSTER, SUBJECT, CONTENTS, LASTPOST, VIEWS, FILENAME " + "FROM DEPARTMETNS "
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
         String sql = "delete from board where no=?";
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
         String sql = "update board set  = ? where no=?";
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
         String sql = "insert into board values (?,?,?,?,?,?,?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, boardVo.getNo());
         pstmt.setString(2, boardVo.getPoster());
         pstmt.setString(3, boardVo.getSubject());
         pstmt.setString(4, boardVo.getContents());
         pstmt.setString(5, boardVo.getLastpost());
         pstmt.setString(6, boardVo.getViews());
         pstmt.setString(7, boardVo.getFilename());
         int r = pstmt.executeUpdate(sql);
         System.out.println(r + "건이 처리됨.");
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         ConnectionManager.close(conn);
      }
   }
}