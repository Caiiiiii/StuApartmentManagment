<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>  <head>    <base href="<%=basePath%>">        <title>My JSP 'stuSearch.jsp' starting page</title>    	<meta http-equiv="pragma" content="no-cache">	<meta http-equiv="cache-control" content="no-cache">	<meta http-equiv="expires" content="0">    	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">	<meta http-equiv="description" content="This is my page">	<link href="css/bootstrap.min.css" rel="stylesheet">	<script src="http://code.jquery.com/jquery-latest.js"></script>	<script src="js/bootstrap.min.js"></script>	 <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>	<!--	<link rel="stylesheet" type="text/css" href="styles.css">	-->  </head>   <body>   <form class="form-inline" name="searchForm">    <select class="form-control" id="searchCondition"> <option value="1">学号</option> <option value="2">姓名</option> </select>    <div class="input-group">     <input type="text" name="inputCondition" id="inputCondition" class="form-control" placeholder="InPutInfo" value="" />    </div>    <input type="button" class="btn btn-primary" onclick="verify()" value="Search">  </form>   <hr> <div id="tableDiv" style="display: none">  <table  id="table"  class="table table-striped" >          <tr id="tr">              <td>学号</td>              <td>姓名</td>              <td>性别</td>            <td>班级</td>              <td>宿舍号</td>            <td>编辑</td>            <td>删除</td>        </tr>       </table>  </div><div id="showNull" style=" display: none; text-align: center;">查询信息不存在</div><!-- Button trigger modal --><!-- Modal --><div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  <div class="modal-dialog" role="document">    <div class="modal-content">      <div class="modal-header">        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        <h4 class="modal-title" id="myModalLabel">警告!</h4>      </div>      <div class="modal-body" id="showName">      </div>      <div class="modal-footer">        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>        <button type="button" class="btn btn-primary" id="checkOn" data-dismiss="modal">确认</button>      </div>    </div>  </div></div><!-- Modal --><div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  <div class="modal-dialog" role="document">    <div class="modal-content">      <div class="modal-header">        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        <h4 class="modal-title" id="myModalLabel">编辑学生信息</h4>      </div>          <div class="formSize">    	<form id="stuAddForm" name="stuAddForm" method="post">    		<div class="form-group has-feedback" id="stuNoDiv">    			<label for="inputStuNo" class="control-label">学号</label>    			<input type="text" name="inputStuNo" class="form-control" id="inputStuNo" readonly="readonly" >    			<span class=" glyphicon glyphicon-ok form-control-feedback display-point" id="NoSuccess"></span>    			<span class=" glyphicon glyphicon-remove form-control-feedback display-point" id="NoFalse"></span>    		</div>    		<div class="form-group ">    			<label for="inputName" class="control-label">姓名</label>    			<input type="text" name="inputName" class="form-control" id="inputName">    		</div>    		<div class="form-group">    			<label for="inputSex" class="control-label">性别</label>    			<select class="form-control" id="sexSelect" name="sexSelect">    				<option value="1">请选择你的性别</option>    				<option value="男">男</option>    				<option value="女">女</option>    			</select>    		</div>    		<div class="form-group">    			<label for="inputClass" class="control-label">班级</label>    			<select class="form-control" id="calssSelect" name="calssSelect">    				<option value="1">请选择你的班级</option>    				<option value="外包">外包</option>    				<option value="生医">生医</option>    				<option value="药剂">药剂</option>    				<option value="中药学">中药学</option>    				<option value="预防医学">预防医学</option>    				<option value="药物制剂">药物制剂</option>    				<option value="临床医学">临床医学</option>    			</select>    		</div>    		<div class="form-group has-feedback" id="DromNoDiv">    			<label for="inputDromNo" class="control-label">宿舍号</label>    			<input type="text" name="inputDromNo" class="form-control" id="inputDromNo">    			<span class=" glyphicon glyphicon-ok form-control-feedback display-point" id="dromNoSuccess"></span>    			<span class=" glyphicon glyphicon-remove form-control-feedback display-point" id="dromNoFalse"></span>    			<div class="label-text display-point" id="label-sign"> </div>    		</div>    	</form>    </div>      <div class="modal-footer">        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>        <button type="button" class="btn btn-primary" id="checkUpdate" data-dismiss="modal">确认</button>      </div>    </div>  </div></div> </body>	<style type="text/css">		.formSize{		margin-left: 100px;  		width: 400px;  	}  	.display-point{  		display: none;  	}  	.label-text{  		text-align: center;  		color: red;  	}  	.formButton{  		position:relative;  		left: 25%;  		width: 50%;  	}	</style> <script type="text/javascript"> 	var xmlhttp; 	var table=document.getElementById('table');   	var tableDiv=document.getElementById('tableDiv');   	function verify(){  		var obj = document.getElementById("searchCondition").value; 				//var selected_val = obj.options[obj.selectedIndex].value;		var iCondition = document.searchForm.inputCondition.value;		if(iCondition!= ""){	  if(window.ActiveXObject){   //是IE浏览器  	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  	  	            }else if(window.XMLHttpRequest){    //除IE外的其他浏览器  	  	                xmlhttp = new XMLHttpRequest();  	            }        	            xmlhttp.withCredentials = true;	            xmlhttp.onreadystatechange = function() {         		  		 	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){						var back =xmlhttp.responseText;						var showNull = document.getElementById("showNull");						if(back != "null"){						showNull.style.display="none";		  		 		tableDiv.style.display="block";		  		 		$("#table  tr:not(:first)").remove();												var sd = eval("("+back+")"); 						var arr = new Array();						var i = 0;						var count = 0;						for(var a in sd.stuBena){ 							i++;													$("#table tbody").append('<tr><td></td><td></td><td></td><td></td><td></td> <td><button class="btn btn-sm btn-warning" id="stuUpdate" data-toggle="modal" data-target="#updateModal" value="'+i+'" onclick="btuUpdate(this);">编辑</button></td> <td><button class="btn btn-sm btn-danger" id="stuDel" data-toggle="modal" data-target="#myModal" value="'+sd.stuBena[a].stuNo+'" onclick="btuDel(this);">删除</button></td></tr>');																	table.rows[i].cells[count].innerHTML = sd.stuBena[a].stuNo;							table.rows[i].cells[count+1].innerHTML = sd.stuBena[a].stuName;							table.rows[i].cells[count+2].innerHTML = sd.stuBena[a].stuSex;							table.rows[i].cells[count+3].innerHTML = sd.stuBena[a].sutClass;							table.rows[i].cells[count+4].innerHTML = sd.stuBena[a].stuDromNo;							//for( var item in sd.stuBena[a]){							//	count++;							//	var p = sd.stuBena[a][item];							//	table.rows[i].cells[count-1].innerHTML = p;							//}							}		  		 		}else if(back == "null"){		  		 				tableDiv.style.display="none";		  		 				showNull.style.display="block";		  		 		}		  		 			  		 }		  	}		  		xmlhttp.open("GET", "servlet/stuSearch?option="+obj+"&inputCondition="+iCondition , true);		  	    xmlhttp.send(); 			}else{		alert("输入值不能为空");	}}		function btuDel(obj){			$("#showName").text("是否删除学号为"+obj.value+"的学生的信息?");			$("#checkOn").click(function(){				$.ajax({					type:'GET',					url:'servlet/stuDelete?stuNo='+obj.value,					success:function(data){						if(data == "1"){							verify();						}						else if (data == "2"){							}					}				});			});	}	function btuUpdate(obj){			var num = 0;			$("#inputStuNo").val(table.rows[obj.value].cells[num].innerHTML);			$("#inputName").val(table.rows[obj.value].cells[num+1].innerHTML);			$("#sexSelect").val(table.rows[obj.value].cells[num+2].innerHTML);			$("#calssSelect").val(table.rows[obj.value].cells[num+3].innerHTML);			$("#inputDromNo").val(table.rows[obj.value].cells[num+4].innerHTML);	}	 $(document).ready(function(){  		var dromJudge = true;  			$("#inputDromNo").blur(function(){  		if($("#inputDromNo").val()!=""){  			$.ajax({  				type:'GET',  				url:'servlet/checkDromSlot?DromNo='+$("#inputDromNo").val(),  				success:function(data){  					if(data == "1"){  						dromJudge = true;  						$("#DromNoDiv").removeClass("has-error");  						$("#DromNoDiv").addClass("has-success");  						$("#dromNoSuccess").css("display","block");  						$("#dromNoFalse").css("display","none");  						$("#label-sign").css("display","none");  					}  						 if(data == "2"){  						 	dromJudge = false;	  						$("#DromNoDiv").removeClass("has-success");	  						$("#DromNoDiv").addClass("has-error");	  						$("#dromNoSuccess").css("display","none");	  						$("#dromNoFalse").css("display","block");	  						$("#label-sign").html("");	  						$("#label-sign").append("该宿舍已满");	  						$("#label-sign").css("display","block");  						}  							 if(data == "3"){  							 	dromJudge = false;  							 	$("#DromNoDiv").removeClass("has-success");		  						$("#DromNoDiv").addClass("has-error");		  						$("#dromNoSuccess").css("display","none");		  						$("#dromNoFalse").css("display","block");		  						$("#label-sign").html("");		  						$("#label-sign").append("不存在该宿舍");		  						$("#label-sign").css("display","block");	  				  							}  				}  			});  		}else{  								dromJudge = false;  								$("#DromNoDiv").removeClass("has-success");		  						$("#DromNoDiv").addClass("has-error");		  						$("#dromNoSuccess").css("display","none");		  						$("#dromNoFalse").css("display","block");		  						$("#label-sign").html("");		  						$("#label-sign").append("不能为空");		  						$("#label-sign").css("display","block");		  						//宿舍号不能为空  		}  	});  			$("#checkUpdate").click(function(){  				if($("#inputName").val()!="" && $("#sexSelect").val()!="1" && $("#calssSelect").val()!="1"){  						if(dromJudge==true){                  var  newinputname =  $("#inputName").val();  								$.ajax({                    type:'POST',                    data:{inputStuNo:$("#inputStuNo").val(),inputName:$("#inputName").val(),sexSelect:$("#sexSelect").val(),calssSelect:$("#calssSelect").val(),inputDromNo:$("#inputDromNo").val()},                    url:'servlet/stuUpdate',                    success:function(data){                        if(data == "1"){                          $("#inputCondition").val(newinputname);                          verify();                                                   }                    }                  });                  //document.stuAddForm.action='servlet/stuUpdate';  								//document.stuAddForm.submit();  						}else{  							alert("请填写正确的信息");  							return false;  						}  				}else{  					alert("请填写完整");  					return false;  				}  				  			});  		}); </script></html>