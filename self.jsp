<%@ page language="java" import="java.sql.*,java.util.*,emp.Employee"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<form onsubmit="self.jsp">
	<input type="text" name="search" placeHolder="search here"> <input
		type="submit" name="name" value="search"><br></br>
</form>
</head>
<body>
	<table border=1px>
		<tr>
			<th>name</th>
			<th>age</th>
			<th>sal</th>
			<th>job</th>
			<th>dept</th>
		</tr>
		<tbody>
			<%
				if (request.getParameter("name") == null || !request.getParameter("name").equals("search")) {
				ArrayList<Employee> aee = (ArrayList<Employee>) request.getAttribute("emp");
				int itemsPerPage = 5;
				int currentPage = 1;
				String pageParam = request.getParameter("page");
				if (pageParam != null) {
					currentPage = Integer.parseInt(pageParam);
				}
				int totalEmployees = aee.size();
				int totalPages = (int) Math.ceil((double) totalEmployees / itemsPerPage);
				int startIndex = (currentPage - 1) * itemsPerPage;
				int endIndex = Math.min(startIndex + itemsPerPage, totalEmployees);
				for (int i = startIndex; i < endIndex; i++) {
					Employee e = aee.get(i);
			%>
			<tr>
				<td><%=e.getName()%></td>
				<td><%=e.getAge()%></td>
				<td><%=e.getSal()%></td>
				<td><%=e.getJob()%></td>
				<td><%=e.getDept()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div>
		<ul class="pagination">
			<%
				for (int i = 1; i <= totalPages; i++) {
			%>
			<a href="?page=<%=i%>"><button><%=i%></button></a>
			<%
				}
			}
				else{
					ArrayList<Employee> aee = (ArrayList<Employee>) request.getAttribute("emp");
					int itemsPerPage = 5;
					int currentPage = 1;
					String pageParam = request.getParameter("page");
					if (pageParam != null) {
						currentPage = Integer.parseInt(pageParam);
					}
					int totalEmployees = 1;
					int totalPages = (int) Math.ceil((double) totalEmployees / itemsPerPage);
					int startIndex = (currentPage - 1) * itemsPerPage;
					int endIndex = Math.min(startIndex + itemsPerPage, totalEmployees);
					for (int i = startIndex; i < endIndex; i++) {
						Employee e = aee.get(i);
						if(e.getName().equals(request.getParameter("search"))){
				%>
			<tr>
				<td><%=e.getName()%></td>
				<td><%=e.getAge()%></td>
				<td><%=e.getSal()%></td>
				<td><%=e.getJob()%></td>
				<td><%=e.getDept()%></td>
			</tr>
			<%
					}}
				%>
			</tbody>
			</table>
			<div>
				<ul class="pagination">
					<%
					for (int i = 1; i <= totalPages; i++) {
				%>
					<a href="?page=<%=i%>"><button><%=i%></button></a>
					<%
					}
				}
			%>
				</ul>
			</div>
</body>
</html>
