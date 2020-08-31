package test;

import java.util.ArrayList;

public class DeptDAOTest {
	public static void main(String[] args) {
		DeptDAO dao = new DeptDAO();
		//dao.insert(new DeptVo(1000,"hello"));
		//dao.update(new DeptVo(1000, "영업"));
//		DeptVo dept = new DeptVo();
//		dept.setDepartment_id(1000);
//		dao.delete(dept);
		System.out.println(dao.selectOne(new DeptVo(10)));
//		ArrayList<DeptVo> list = dao.selectAll(null);
//		for(DeptVo vo : list) {
//			System.out.println(vo.toString());
//		}
		
	}
}
