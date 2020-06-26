<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="index.css">
        <title>학생 명부 사이트</title>
        <%
            String driver	= "oracle.jdbc.driver.OracleDriver"; 
            String db_url	= "jdbc:oracle:thin:@//localhost:1521/xe";
            String db_user	= "system";
            String db_pw	= "1234";
            String query 	= "SELECT studno, name, dept FROM student";
            
            Connection conn 		= null;
            Statement stmt 			= null;
            ResultSet rs 			= null;	
        %>
    </head>
    <body>
        <%
            Class.forName(driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pw);
            stmt = conn.createStatement();
            rs 	 = stmt.executeQuery(query);
        %>
        <header>
            <a href="#">학교 정보</a>
            <a href="#">학생 앨범</a>
            <a href="#">학생 명부</a>
            <a href="#">학교 연혁</a>
            <a href="#">학교 알림</a>
            
        </header>
        <nav>
            <ul>
                <li><a href="#">학생 정보 추가</a></li>
                <li><a href="#">학생 정보 수정</a></li>
                <li><a href="#">학생 정보 삭제</a></li>
            </ul>
        </nav>
        <section>
            <h1>학생 명부 목록</h1>
            <table>
                <thead>
                    <tr>
                        <th>학번</th>
                        <th>이름</th>
                        <th>학과</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>10101</td>
                        <td>강건구</td>
                        <td>건설정보과</td>
                    </tr>
                    <tr>
                        <td>10222</td>
                        <td>안신호</td>
                        <td>건축과</td>
                    </tr>
                    <tr>
                        <td>10303</td>
                        <td>박지성</td>
                        <td>자동화기계과</td>
                    </tr>
                    <tr>
                        <td>21202</td>
                        <td>김건희</td>
                        <td>건축과</td>
                    </tr>
                    <tr>
                        <td>21203</td>
                        <td>안영철</td>
                        <td>컴퓨터공학과</td>
                    </tr>
                    <tr>
                        <td>21205</td>
                        <td>서진수</td>
                        <td>컴퓨터공학과</td>
                    </tr>
                    <tr>
                        <td>31202</td>
                        <td>나영희</td>
                        <td>자동화기계과</td>
                    </tr>
                    <tr>
                        <td>30222</td>
                        <td>엄준서</td>
                        <td>자동화기계과</td>
                    </tr>
                    <tr>
                        <td>30202</td>
                        <td>김민철</td>
                        <td>컴퓨터공학과</td>
                    </tr>
                    <tr>
                        <td>31515</td>
                        <td>김철수</td>
                        <td>컴퓨터공학과</td>
                    </tr>
                    <tr>
                        <td>10505</td>
                        <td>엄준식</td>
                        <td>나노신기술학과</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </body>
</html>