<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  

 <body> 
  <form class="form-inline" name="searchForm"> 
   <select class="form-control" id="searchCondition"> <option value="1">学号</option> <option value="2">姓名</option> </select> 
   <div class="input-group"> 
    <input type="text" name="inputCondition" class="form-control" placeholder="InPutInfo" /> 
   </div> 
   <input type="button" class="btn btn-primary" onclick="verify()" value="Search">
  </form> 
  <hr>

  <div id="result"></div>
 </body>

 <script type="text/javascript">
 	var xmlhttp;
  	function verify(){

	  if(window.ActiveXObject){   //是IE浏览器  
	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
	  
	            }else if(window.XMLHttpRequest){    //除IE外的其他浏览器  
	  
	                xmlhttp = new XMLHttpRequest();  
	            }        
	            xmlhttp.withCredentials = true;

				var obj = document.getElementById("searchCondition").value; 
				//var selected_val = obj.options[obj.selectedIndex].value;

		  		var iCondition = document.searchForm.inputCondition.value;

	            xmlhttp.onreadystatechange = function() {         
		  		 	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						
		  		 	}
		  		 }

		  		xmlhttp.open("GET", "servlet/stuSearch?option="+obj+"&inputCondition="+iCondition , true);

		  	    xmlhttp.send(); 		
	}
 </script>
</html>

