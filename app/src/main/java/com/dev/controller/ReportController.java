package com.dev.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

public class ReportController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// db conn
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn;
		try {
			conn = DriverManager.getConnection(jdbc_url, "hr", "hr");

			// jasper 파일 로드
			// InputStream jasperStream =
			// getClass().getResourceAsStream("/empMaster.jasper");
			// JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
			// 소스 컴파일 jrxml -> jasper
			InputStream stream = getClass().getResourceAsStream("/reports/empMaster.jrxml");
			JasperReport jasperReport = JasperCompileManager.compileReport(stream);
			
			
			//서브레포트 소스 파일 컴파일
			// 소스파일 컴파일하여 저장 : compileReportToFile
			String jrxmlFile = getClass().getResource("/reports/sales_subreport.jrxml").getFile();
			System.out.println(jrxmlFile);
			JasperCompileManager.compileReportToFile(jrxmlFile);
			
			
			// pdf 생성해서 브라우저로 출력
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JRException e) {
			e.printStackTrace();
		}

	}

}
