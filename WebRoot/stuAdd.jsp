<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuAdd.jsp' starting page</title>
    
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
    <div class="formSize">
    	<form id="stuAddForm" name="stuAddForm" method="post">
    		<div class="form-group has-feedback" id="stuNoDiv">
    			<label for="inputStuNo" class="control-label">学号</label>
    			<input type="text" name="inputStuNo" class="form-control" id="inputStuNo"  >
    			<span class=" glyphicon glyphicon-ok form-control-feedback display-point" id="NoSuccess"></span>
    			<span class=" glyphicon glyphicon-remove form-control-feedback display-point" id="NoFalse"></span>
    		</div>
    		<div class="form-group ">
    			<label for="inputName" class="control-label">姓名</label>
    			<input type="text" name="inputName" class="form-control" id="inputName">
    		</div>
    		<div class="form-group">
    			<label for="inputSex" class="control-label">性别</label>
    			<select class="form-control" id="sexSelect" name="sexSelect">
    				<option value="1">请选择你的性别</option>
    				<option value="男">男</option>
    				<option value="女">女</option>
    			</select>
    		</div>
    		<div class="form-group">
    			<label for="inputClass" class="control-label">班级</label>
    			<select class="form-control" id="calssSelect" name="calssSelect">
    				<option value="1">请选择你的班级</option>
    				<option value="外包">外包</option>
    				<option value="生医">生医</option>
    				<option value="药剂">药剂</option>
    				<option value="中药学">中药学</option>
    				<option value="预防医学">预防医学</option>
    				<option value="药物制剂">药物制剂</option>
    				<option value="临床医学">临床医学</option>
    			</select>
    		</div>
    		<div class="form-group has-feedback" id="DromNoDiv">
    			<label for="inputDromNo" class="control-label">宿舍号</label>
    			<input type="text" name="inputDromNo" class="form-control" id="inputDromNo">
    			<span class=" glyphicon glyphicon-ok form-control-feedback display-point" id="dromNoSuccess"></span>
    			<span class=" glyphicon glyphicon-remove form-control-feedback display-point" id="dromNoFalse"></span>
    			<div class="label-text display-point" id="label-sign"> </div>
    		</div>
    		<div class="formButton">
    			<input type="button" id="inputButton" class="btn btn-primary btn-block" value="添加">
    		</div>
    	</form>
    </div>
  </body>

  <style type="text/css">
  	.formSize{
  		width: 400px;
  	}
  	.display-point{
  		display: none;
  	}
  	.label-text{
  		text-align: center;
  		color: red;
  	}
  	.formButton{
  		position:relative;
  		left: 25%;
  		width: 50%;
  	}
  </style>

  <script type="text/javascript">
  $(document).ready(function(){
  		var noJudge  = true;
  		var dromJudge = true;


  		$("#inputStuNo").blur(function(){
  		 	if($("#inputStuNo").val()!=""){
  			$.ajax({
  				type:'GET',
  				url:'servlet/checkStuNo?inputStuNo='+ $("#inputStuNo").val(),
  				success:function(data){
  					if(data == "have"){
  						 noJudge  = false;
  						$("#stuNoDiv").removeClass("has-success");
  						$("#stuNoDiv").addClass("has-error");
  						$("#NoSuccess").css("display","none");
  						$("#NoFalse").css("display","block");

  					}
  					else if(data == "havent"){
  						 noJudge  = true;
  						$("#stuNoDiv").removeClass("has-error");
  						$("#stuNoDiv").addClass("has-success");
  						$("#NoSuccess").css("display","block");
  						$("#NoFalse").css("display","none");
  					}
  					else if(data == "error"){
  						 noJudge  = false;
  						$("#stuNoDiv").removeClass("has-success");
  						$("#stuNoDiv").addClass("has-error");
  						$("#NoSuccess").css("display","none");
  						$("#NoFalse").css("display","block");
  					}
  				},
  				error:function(jqXHR){

  				}
  			});
		}else{
						noJudge  = false;
						$("#stuNoDiv").removeClass("has-success");
  						$("#stuNoDiv").addClass("has-error");
  						$("#NoSuccess").css("display","none");
  						$("#NoFalse").css("display","block");
		}
  			       //成功后加class
  			});

  			$("#inputDromNo").blur(function(){
  		if($("#inputDromNo").val()!=""){
  			$.ajax({
  				type:'GET',
  				url:'servlet/checkDromSlot?DromNo='+$("#inputDromNo").val(),
  				success:function(data){
  					if(data == "1"){
  						dromJudge = true;
  						$("#DromNoDiv").removeClass("has-error");
  						$("#DromNoDiv").addClass("has-success");
  						$("#dromNoSuccess").css("display","block");
  						$("#dromNoFalse").css("display","none");
  						$("#label-sign").css("display","none");
  					}
  						 if(data == "2"){
  						 	dromJudge = false;
	  						$("#DromNoDiv").removeClass("has-success");
	  						$("#DromNoDiv").addClass("has-error");
	  						$("#dromNoSuccess").css("display","none");
	  						$("#dromNoFalse").css("display","block");
	  						$("#label-sign").html("");
	  						$("#label-sign").append("该宿舍已满");
	  						$("#label-sign").css("display","block");
  						}
  							 if(data == "3"){
  							 	dromJudge = false;
  							 	$("#DromNoDiv").removeClass("has-success");
		  						$("#DromNoDiv").addClass("has-error");
		  						$("#dromNoSuccess").css("display","none");
		  						$("#dromNoFalse").css("display","block");
		  						$("#label-sign").html("");
		  						$("#label-sign").append("不存在该宿舍");
		  						$("#label-sign").css("display","block");	  				
  							}
  				}
  			});
  		}else{
  								dromJudge = false;
  								$("#DromNoDiv").removeClass("has-success");
		  						$("#DromNoDiv").addClass("has-error");
		  						$("#dromNoSuccess").css("display","none");
		  						$("#dromNoFalse").css("display","block");
		  						$("#label-sign").html("");
		  						$("#label-sign").append("不能为空");
		  						$("#label-sign").css("display","block");
		  						//宿舍号不能为空
  		}
  	});

  			$("#inputButton").click(function(){
  				if($("#inputName").val()!="" && $("#sexSelect").val()!="1" && $("#calssSelect").val()!="1"){
  						if(noJudge==true&&dromJudge==true){
  								document.stuAddForm.action='servlet/stuAdd';
  								document.stuAddForm.submit();
  						}else{
  							alert("请填写正确的信息");
  							return false;
  						}
  				}else{
  					alert("请填写完整");
  					return false;
  				}
  				
  			});

  		});



  </script>
</html>
