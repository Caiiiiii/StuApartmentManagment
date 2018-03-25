<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ElectricUpdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div class="formSize">
   		<form class="form-inline">
 				<select class="form-control" id="searchSelect">
 					<option value="1">楼层</option>
 					<option value="2">宿舍号</option>
 				</select>
 				<div class="input-group">
 				<input type="text" name="inputCondition" id="inputCondition" class="form-control" />
 				</div>
 				<input type="button" class="btn btn-primary" value="Search" onclick="clickSearch()">
   		</form>
   	</div>

   	<div id="tableDiv" style="display: none">
 			<table  id="table"  class="table table-striped" >  
       		 	<tr id="tr">  
		            <td>宿舍号</td>  
		            <td>2017年电费</td>
		            <td>2018年电费</td>
		            <td>操作</td>
        		</tr>   
   			</table>  
	</div>
	<div id="showError" style=" display: none; text-align: center;">查询信息不存在</div>
	<div id="showNull" style=" display: none; text-align: center;">不能为空</div>

	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">电费增加</h4>
      </div>

	<div class="iFormSize">
      		<form id="ElectircAddForm" name="ElectircAddForm" method="post">
      			<div class="form-group has-feedback" id="addDromNoDiv">
      				<label for="addDromNo" class="control-lable">宿舍号</label>
      				<input type="text" name="addDromNo" id="addDromNo" class="form-control" readonly="readonly">
      			</div>
      			<div class="form-group">
    			<label for="addInputYear" class="control-label">年份</label>
    			<select class="form-control" id="addYearSelect" name="addYearSelect">
    				<option value="1">请选择年份</option>
    				<option value="2017">2017</option>
    				<option value="2018">2018</option>
    			</select>
    		</div>
    		<div class="form-group ">
    			<label for="addInputFare" class="control-label">电费</label>
    			<input type="text" name="addInputFare" class="form-control" id="addInputFare">
    		</div>
    		<div class="label-text display-point" id="label-sign"> </div>
      		</form>
      	</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="dromAdd" data-dismiss="modal">确认</button>
      </div>
    </div>
  </div>
</div>

	<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">电费删除</h4>
      </div>
      	<div class="iFormSize">
      		<form id="ElectircDelForm" name="ElectircDelForm" method="post">
      			<div class="form-group has-feedback" id="delDromNoDiv">
      				<label for="delDromNo" class="control-lable">宿舍号</label>
      				<input type="text" name="delDromNo" id="delDromNo" class="form-control" readonly="readonly">
      			</div>
      			<div class="form-group">
    			<label for="delInputYear" class="control-label">年份</label>
    			<select class="form-control" id="delYearSelect" name="delYearSelect">
    				<option value="1">请选择年份</option>
    				<option value="2017">2017</option>
    				<option value="2018">2018</option>
    			</select>
    		</div>
    		<div class="label-text display-point" id="label-sign1"> </div>
      		</form>
      	</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="dromDel" data-dismiss="modal">确认</button>
      </div>
    </div>
  </div>
</div>

  </body>

  <style type="text/css">
  	.formSize{
  		width: 400px;
  	}
  	.iFormSize{
  		margin-left: 100px;
  		width: 400px;
  	}
  	.display-point{
  		display: none;
  	}
  	.label-text{
  		text-align: center;
  		color: red;
  	}
  	.inputSize{
  		margin-left: 50px;
  		width: 400px;
  	}
  </style>

  <script type="text/javascript">
  	function clickSearch(){
  			if($("#inputCondition").val() != ""){
  			$.ajax({
  				type:'GET',
  				data:{selectOption:$("#searchSelect").val(),inputCondition:$("#inputCondition").val()},
  				url:'servlet/eletricSearch',
  				success:function(data){
  						if(data != "null"){
  							showNull.style.display="none";
							showError.style.display="none";
		  		 			tableDiv.style.display="block";
		  		 			$("#table  tr:not(:first)").remove();
  							var sd = eval("("+data+")");

  							var i =0; var count = 0;
  							for(var a in sd.ElectricBean){
  								i++;

  								$("#table tbody").append('<tr><td></td><td></td><td></td>  <td><button class="btn btn-sm btn-warning" id="eletricAdd" data-toggle="modal" data-target="#addModal" value="'+i+'" onclick="btuAdd(this);">添加</button>    <button class="btn btn-sm btn-danger" id="eletricDel" data-toggle="modal" data-target="#delModal" value="'+i+'" onclick="btuDel(this);">删除</button></td> </tr>');

  								table.rows[i].cells[count].innerHTML = sd.ElectricBean[a].dromNo;
							table.rows[i].cells[count+1].innerHTML = sd.ElectricBean[a].yearIn2017;
							table.rows[i].cells[count+2].innerHTML = sd.ElectricBean[a].yearIn2018;

  							}
  						}else if(data == "null"){

		  		 				tableDiv.style.display="none";
		  		 				showError.style.display="block";
		  		 				showNull.style.display="none";
		  		 		}
  				}
  			});
		}
		else{
								tableDiv.style.display="none";
		  		 				showError.style.display="none";
		  		 				showNull.style.display="block";
		}	
  	}

  	function btuAdd(obj){
  			var num = 0;
			$("#addDromNo").val(table.rows[obj.value].cells[num].innerHTML);
			$("#dromAdd").click(function(){
				if($("#addInputFare").val()!="" && $("#addYearSelect").val!="1"){
					$.ajax({
						type:'POST',
						data:{DromNo:$("#addDromNo").val(),Year:$("#addYearSelect").val(),Fare:$("#addInputFare").val()},
						url:'servlet/eletricAddFare',
						success:function(data){
							if(data == "1"){
								clickSearch();
							}
						}
					});
			}else{
					alert("请填写完整");
			}
			});
  	}

  	function btuDel(obj){
			var num = 0;
			$("#delDromNo").val(table.rows[obj.value].cells[num].innerHTML);
			$("#dromDel").click(function(){
				if($("#delYearSelect").val!="1"){
					$.ajax({
						type:'POST',
						data:{DromNo:$("#delDromNo").val(),Year:$("#delYearSelect").val()},
						url:'servlet/eletricDelFare',
						success:function(data){
							if(data == "1"){
								clickSearch();
							}
						}
					});
			}else{
					alert("请填写完整");
			}
			});
  	}
  </script>
</html>
