package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import common.ConnectionManager;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	public MemberVo selectOne(MemberVo memberVo) {
		MemberVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT ID, PW, JOB, GENDER, MAILYN, REASON"
						+ " FROM MEMBER"
						+ " WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVo = new MemberVo();
				resultVo.setId(rs.getString(1));
				resultVo.setPw(rs.getString(2));
				resultVo.setJob(rs.getString(3));
				resultVo.setGender(rs.getString(4));
				resultVo.setMailyn(rs.getString(5));
				resultVo.setReason(rs.getString(6));
			} else {
				System.out.println("No data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}
	
	public void delete(MemberVo memberVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE MEMBER WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			int r = pstmt.executeUpdate();
			System.out.println(r+"건 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public void update(MemberVo memberVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE MEMBER SET PW = ? WHERE ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getPw());
			pstmt.setString(2, memberVo.getId());
			int r = pstmt.executeUpdate();
			System.out.println(r+"건 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public void insert(MemberVo memberVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into member (id, pw, job, gender, mailyn, reason) "
					+ "values (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPw());
			pstmt.setString(3, memberVo.getJob());
			pstmt.setString(4, memberVo.getGender());
			pstmt.setString(5, memberVo.getMailyn());
			pstmt.setString(6, memberVo.getReason());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
	
	public ArrayList<MemberVo> selectAll(MemberVo memberVo) {
		ArrayList<MemberVo> list = new ArrayList<>();
		MemberVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT ID, PW, JOB, GENDER, MAILYN, REASON"
					+ " FROM MEMBER ORDER BY DEPARTMENT_ID";			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MemberVo();
				resultVo.setId(rs.getString(1));
				resultVo.setPw(rs.getString(2));
				resultVo.setJob(rs.getString(3));
				resultVo.setGender(rs.getString(4));
				resultVo.setMailyn(rs.getString(5));
				resultVo.setReason(rs.getString(6));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
}
