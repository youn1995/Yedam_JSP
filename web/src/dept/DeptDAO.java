package dept;

import common.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DeptDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//전체 건수 
		public int count(DeptVo deptVo) {
			ResultSet rs = null;
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String where = "where 1=1";
				if(deptVo.getDepartment_name() != null) {
					where += " and department_name like '%' || ? || '%'";
				}
				String sql = "select count(*) from hr.departments " + where;
				pstmt = conn.prepareStatement(sql);
				int pos = 1;
				if (deptVo.getDepartment_name() != null) {
					pstmt.setString(pos++, deptVo.getDepartment_name());
				}
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(conn);
			}
			return cnt;
		}
	
	
	public ArrayList<DeptVo> selectAll(DeptVo deptVo) {
		ArrayList<DeptVo> list = new ArrayList<>();
		DeptVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID as mgr_id, LOCATION_ID"
						+ " FROM hr.departments ORDER BY DEPARTMENT_ID"; //ctrl+shift+x,y 대문자 소문자 바꾸는거
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, deptVo.getDepartment_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new DeptVo();
				resultVo.setDepartment_id(rs.getInt(1));
				resultVo.setDepartment_name(rs.getString("department_name"));
				resultVo.setManager_id(rs.getInt("mgr_id"));
				resultVo.setLocation_id(rs.getInt("LOCATION_ID"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<DeptVo> selectAllPage(DeptVo deptVo) {
		ArrayList<DeptVo> list = new ArrayList<>();
		DeptVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String where = "where 1=1";
			if(deptVo.getDepartment_name() != null) {
				where += " and department_name like '%' || ? || '%'";
			}
			
			String sql = "SELECT A.*  FROM ( SELECT ROWNUM RN, B.*  FROM ( " + 
					"    SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID AS MGR_ID, LOCATION_ID " + 
					" FROM HR.DEPARTMENTS "
					+ where + 
					" ORDER BY DEPARTMENT_ID   " + 
					 ") B ) A WHERE RN BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			if (deptVo.getDepartment_name() != null) {
				pstmt.setString(pos++, deptVo.getDepartment_name());
			}
			pstmt.setInt(pos++, deptVo.getStartNum());
			pstmt.setInt(pos++, deptVo.getLastNum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new DeptVo();
				resultVo.setDepartment_id(rs.getInt(1));
				resultVo.setDepartment_name(rs.getString("department_name"));
				resultVo.setManager_id(rs.getInt("mgr_id"));
				resultVo.setLocation_id(rs.getInt("LOCATION_ID"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	public DeptVo selectOne(DeptVo deptVo) {
		DeptVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID as mgr_id, LOCATION_ID"
						+ " FROM hr.departments"
						+ " WHERE DEPARTMENT_ID = ?"; //ctrl+shift+x,y 대문자 소문자 바꾸는거
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, deptVo.getDepartment_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVo = new DeptVo();
				resultVo.setDepartment_id(rs.getInt(1));
				resultVo.setDepartment_name(rs.getString("department_name"));
				resultVo.setManager_id(rs.getInt("mgr_id"));
				resultVo.setLocation_id(rs.getInt("LOCATION_ID"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}

	public void delete(DeptVo deptVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete hr.departments where department_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptVo.getDepartment_id());
			int r = pstmt.executeUpdate();
			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public void update(DeptVo deptVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update hr.departments set department_name = ? where department_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptVo.getDepartment_name());
			pstmt.setInt(2, deptVo.getDepartment_id());
			int r = pstmt.executeUpdate();
			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}

	public void insert(DeptVo deptVo) {
		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			// 2.sql 구문실행
			String sql = "insert into hr.departments (department_id, department_name, location_id, manager_id) values(" + deptVo.getDepartment_id()
					+ ",'" + deptVo.getDepartment_name() + "',"+ deptVo.getLocation_id()+"," + deptVo.getManager_id()+")";
			Statement stmt = conn.createStatement(); // STATEMENT는 sql 구문을 완벽하게 해줘야함
			int r = stmt.executeUpdate(sql);
			// 3.결과처리
			System.out.println(r + "건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4.연결해제
			ConnectionManager.close(conn);
		}
	}
}
