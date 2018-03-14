<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
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

 

<div id="tableDiv" style="display: none">
  <table  id="table"  class="table table-striped" >  
        <tr id="tr">  
            <td>学号</td>  
            <td>姓名</td>  
            <td>性别</td>
            <td>班级</td>  
            <td>宿舍号</td>
        </tr>   
    </table>  
</div>
<div id="showNull" style=" display: none; text-align: center;">查询信息有误</div>


 </body>
	
 <script type="text/javascript">

 	var xmlhttp;
 	var table=document.getElementById('table');  
 	var tableDiv=document.getElementById('tableDiv'); 
  	function verify(){
  		var obj = document.getElementById("searchCondition").value; 
				//var selected_val = obj.options[obj.selectedIndex].value;
		var iCondition = document.searchForm.inputCondition.value;

		if(iCondition!= ""){

	  if(window.ActiveXObject){   //是IE浏览器  
	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
	  
	            }else if(window.XMLHttpRequest){    //除IE外的其他浏览器  
	  
	                xmlhttp = new XMLHttpRequest();  
	            }        
	            xmlhttp.withCredentials = true;

	            xmlhttp.onreadystatechange = function() {         
		  		 	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						var back =xmlhttp.responseText;
						var showNull = document.getElementById("showNull");
						if(back != "null"){
						showNull.style.display="none";
		  		 		tableDiv.style.display="block";
		  		 		$("#table  tr:not(:first)").remove();
						
						var sd = eval("("+back+")"); 
						var arr = new Array();
						var i = 0;
						var count = 0;
						for(var a in sd.stuBena){ 
							i++;
							
						$("#table tbody").append('<tr><td></td><td></td><td></td><td></td><td></td></tr>');
										

							table.rows[i].cells[count].innerHTML = sd.stuBena[a].stuNo;
							table.rows[i].cells[count+1].innerHTML = sd.stuBena[a].stuName;
							table.rows[i].cells[count+2].innerHTML = sd.stuBena[a].stuSex;
							table.rows[i].cells[count+3].innerHTML = sd.stuBena[a].sutClass;
							table.rows[i].cells[count+4].innerHTML = sd.stuBena[a].stuDromNo;
							//for( var item in sd.stuBena[a]){
							//	count++;
							//	var p = sd.stuBena[a][item];
							//	table.rows[i].cells[count-1].innerHTML = p;
							//}
							}
		  		 		}else if(back == "null"){
		  		 				tableDiv.style.display="none";
		  		 				showNull.style.display="block";
		  		 		}
		  		 	
		  		 }
		  	}
		  		xmlhttp.open("GET", "servlet/stuSearch?option="+obj+"&inputCondition="+iCondition , true);

		  	    xmlhttp.send(); 		
	}else{
		alert("输入值不能为空");
	}

}
 </script>
</html>

