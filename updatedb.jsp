<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
request.setCharacterEncoding("UTF-8");
 
    String id = request.getParameter("id");
    System.out.println("id======"+id);
    
    String scenario_name = request.getParameter("scenario_name");
    System.out.println("scenario_name======"+scenario_name);
 
    String scenario_condition = request.getParameter("scenario_condition");
    System.out.println("scenario_condition======"+scenario_condition);
    
    String asset_name = request.getParameter("asset_name");
    System.out.println("asset_name======"+asset_name);
 
    String infringement_level = request.getParameter("infringement_level");
    System.out.println("infringement_level======"+infringement_level);
    
    String scenario_sum = request.getParameter("scenario_sum");
    System.out.println("scenario_sum======"+scenario_sum);
 
    String scenario_content = request.getParameter("scenario_content");
    System.out.println("scenario_content======"+scenario_content);
    
    String time = null;
    
      if(id==null || scenario_name==null){
        throw new Exception("데이터를 입력하세요.");
    }
 
    Connection conn = null;
    Statement stmt = null;
    
    try{
    	
			String dbURL ="jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC";
	        String dbID = "root";
	        String dbPassword = "password";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	
        //db insert시 한글 깨져서 db명 뒤에 ?useUnicode=true&characterEncoding=utf-8 붙여주니 안깨지고 들어간다.
        if(conn == null)
            throw new Exception("데이터베이스에 연결할 수 없습니다.");
        stmt = conn.createStatement();
        String command = String.format("update scenarioitem set scenario_name='%s', infringement_level='%s', asset_name='%s', scenario_condition='%s', scenario_content='%s'" + "where id='%s'", scenario_name,infringement_level,asset_name, scenario_condition, scenario_sum, scenario_content, id);
        int rowNum = stmt.executeUpdate("command");
        if(rowNum<1)
            throw new Exception("데이터를 DB에 입력할 수 없습니다.");
    }
    finally{
        try{
            stmt.close();
        }
        catch(Exception ignored){
        }
        try{
            conn.close();
        }
        catch(Exception ignored){
        }
    }
    
    response.sendRedirect("scenario.jsp?idx="+id);
%>


