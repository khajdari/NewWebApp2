<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.net.Socket" %>
<%@ page import="java.io.ObjectOutputStream" %>
<%@ page import="java.io.ObjectInputStream" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<title>CCP6418</title>
</head>
<body bgcolor="FEF9E7">
    <p>
    <center>
		<img src="logo.jpg">
	</center>
	<p>
	<p>
	
	<font face="verdana" color="green">
	<h1>Welcome to CCP6418!</h1>
	<p>
	<p>
	<p>Today's topic: Geometric Shapes.
	<p>Check the following ones.
	<ol>
        <li><a href="Circle.jsp">Circle</a></li>
        <li><a href="Ellipse.jsp">Ellipse</a></li>
        <li><a href="RightTriangle.jsp">Right Triangle</a></li>
        <li><a href="RightRectangle.jsp">Right Rectangle</a></li>
        <li><a href="IsoscelesTrapezoid.jsp">Isosceles Trapezoid</a></li>
        <li><a href="IsoscelesTriangle.jsp">Isosceles Triangle</a></li>
        <li><a href="EquilateralTriangle.jsp">Equilateral Triangle</a></li>
        <li><a href="Square.jsp">Square<a></li>
        <li><a href="Pentagon.jsp">Pentagon</a></li>
        <li><a href="Hexagon.jsp">Hexagon</a></li>
    </ol>
    <br>
	<%
		String SERVER_HOST = "ec2-54-87-216-48.compute-1.amazonaws.com";
		int SERVER_PORT = 10001;
		Socket cskt;
		try {
			cskt = new Socket(SERVER_HOST, SERVER_PORT);
			ObjectOutputStream oos = new ObjectOutputStream(cskt.getOutputStream());
			ObjectInputStream ois = new ObjectInputStream(cskt.getInputStream());

			oos.writeObject("get quote");
			String[] reply = (String[])ois.readObject();
			out.println(reply[0] + " -" + reply[1]);
			oos.close();
			ois.close();
			cskt.close();
		} catch (UnknownHostException e) {
			out.println(e);
		} catch (IOException e) {
			out.println(e);
		} catch (ClassNotFoundException e) {
			out.println(e);
		}
	%>
	<br>
	<br>
	<center>
		<font size="2">
		<p>&copy; AthTech, 2020, all rights reserved.
		<p>email: <a href="mailto:sefremidis@athtech.gr">sefremidis@athtech.gr</a>
		<p>URL: <a href="https://athtech.gr">www.athtech.gr</a>
		<p>Current time: <%=LocalDateTime.now()%>
		</p>
		</font>
	</center>
	</font>
</body>
</html>

