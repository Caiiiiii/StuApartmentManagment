<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>  <head>    <base href="<%=basePath%>">        <title>My JSP 'managerMain.jsp' starting page</title>    	<meta http-equiv="pragma" content="no-cache">	<meta http-equiv="cache-control" content="no-cache">	<meta http-equiv="expires" content="0">    	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">	<meta http-equiv="description" content="This is my page">	<!--	<link rel="stylesheet" type="text/css" href="styles.css">	-->  </head>  	<frameset rows="68,*" frameborder="yes" border="1" framespacing="1">  			<frame src="top.jsp" noresize="noresize" scrolling="No" ></frame> 		<frameset cols="240,*" frameborder="no" border="0" framespacing="1">	   		<frame src="Navigation.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"></frame>	   		<frame src="blank.jsp" name="mainFrame" noresize="noresize" id="mainFrame" title="mainFrame"></frame>   	    </frameset>   	<frameset>  <body>   	  </body></html>