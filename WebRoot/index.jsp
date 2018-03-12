<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./css/spop.css">
	<script type="text/javascript" src="./js/spop.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <style type="text/css">

	 a:link {
	text-decoration: none;
	}
	a:visited{
	text-decoration: none;
	}
	a:hover {
	text-decoration: none;
	}
	a:active{
	text-decoration:none;
	}

  	body{
  	 background: url(picture/backG.jpg) no-repeat;
  	 background-size:100% 100%;
  	 overflow: hidden;
  	}
  	.tilte-location{
  	text-align: center; 
  	font-size: 80px;
  	color: white;
  	}

  	.button-location{
    text-align: center; 
   	/*让div内部文字居中*/
    border-radius: 20px;
    width: 400px;
    height: 350px;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-color: black;
	}

	.loginbtn{
		width: 40%;
	}

	.bigbtu{
		border-radius: 10px;
	}

	.panel-size{
		font-size: 30px;
		padding: 10px;
	}

	.noline{
		text-decoration: none;
		text-decoration:  
	}
  </style>

  <script type="text/javascript">
  	

  	var xmlhttp;
  	function verify(){
	  if(window.ActiveXObject){   //是IE浏览器  
	  		spop('<strong>Error Here!</strong>', 'error');
	                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
	  
	            }else if(window.XMLHttpRequest){    //除IE外的其他浏览器  
	  
	                xmlhttp = new XMLHttpRequest();  
	            }        
	            xmlhttp.withCredentials = true;

				var musername = document.managerForm.managerUserName.value;
		  		var mpassword = document.managerForm.managerPassWord.value;

	            xmlhttp.onreadystatechange = function() {         
		  		 	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		  		 				var rpT = xmlhttp.responseText;
		  		 				if(musername==""||mpassword){
									spop({
									    template: '账号或密码不能为空',
									    style: 'error',
									    autoclose: 2000
									});
		  		 				}
		  		 				 else if(rpT == 1){
		  		 					spop({
									    template: '账号或密码错误',
									    style: 'error',
									    autoclose: 2000
									});
		  		 					 	
		  		 				}else if(rpT == 2){
		  		 					spop({
									    template: '你没有该权限', 
									    style: 'error',
									    autoclose: 2000
									});
		  		 					
		  		 				}else if(rpT == 3){
		  		 					spop({
									    template: '登录成功', 
									    style: 'success',
									    autoclose: 2000
									});
		  		 				}
		  		 			    

		  		 	}
		  		 }

		 		

		  		var url = "servlet/LoginVerification";
			
		  		var post = "managerUserName="+ musername + "&managerPassWord=" + mpassword;  

		  		xmlhttp.open("POST", url, true);
		  		xmlhttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
				xmlhttp.setRequestHeader("cache-control", "no-cache");
		  	    xmlhttp.send(post); 		
	}


function toast(){
			spop('<strong>Error Here!</strong>', 'error');
}

  </script>

  <body class="background">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <h1 class="tilte-location">
  学生公寓管理系统
  </h1>

<div id="resultDiv"></div>


<div class="button-location">
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title  panel-size">
        <a class="noline" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          管理人员登录
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <form name="managerForm">
		  <div class="form-group">
		    <label for="managerInputName">管理人员账号</label>
		    <input type="text" class="form-control" id="managerInputName" placeholder="UserName" name="managerUserName">
		  </div>
		  <div class="form-group">
		    <label for="managerInputPassWord">密码</label>
		    <input type="password" class="form-control" id="managerInputPassWord" placeholder="Password" name="managerPassWord">
		  </div>
		  <div>
		  	<input class="btn btn-info loginbtn" type="button" value="登录" onclick="verify()">
		  </div>
		</form>
      </div>
    </div>
  </div>
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title  panel-size">
        <a class="collapsed noline" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          后勤人员登录
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body bigbtu">
       <form action="servlet/LoginVerification" method="post">
		  <div class="form-group">
		    <label for="exampleInputEmail1">后勤人员账号</label>
		    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="UserName" name="supportUserName">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密码</label>
		    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="supportPassWord">
		  </div>
		  <div>
		  	 <input class="btn btn-info loginbtn" type="button" value="登录" onclick="verify()">
		  </div>
		</form>
      </div>
    </div>
  </div>

</div>




  </body>
</html>
