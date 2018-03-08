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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <style type="text/css">
  	.background{
  		background-color: #2b3137;
  	}
  	.tilte-location{
  		 text-align: center; 
  		 font-size: 80px;
  		 color: white;
  	}

  	.button-location{
    text-align: center; 
   	/*让div内部文字居中*/
    background-color: #2b3137;
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

	.panel-size{
		font-size: 30px;
		padding: 10px;
	}

	


  </style>

  <body class="background">
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <h1 class="tilte-location">
  学生公寓管理系统
  </h1>

<div class="button-location">

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title  panel-size">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          管理人员登录
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <form  action="servlet/LoginVerification" method="post">
		  <div class="form-group">
		    <label for="exampleInputEmail1">管理人员账号</label>
		    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="UserName" name="managerUserName">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密码</label>
		    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="managerPassWord">
		  </div>
		  <div>
		  	 <button type="submit" class="btn btn-default">登录</button>
		  </div>
		</form>
      </div>
    </div>
  </div>
  <div class="panel panel-info">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title  panel-size">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          后勤人员登录
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
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
		  	 <button type="submit" class="btn btn-default">登录</button>
		  </div>
		</form>
      </div>
    </div>
  </div>

</div>



  </body>
</html>
