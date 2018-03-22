<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%><%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>  <head>    <base href="<%=basePath%>">        <title>My JSP 'stuSearch.jsp' starting page</title>    	<meta http-equiv="pragma" content="no-cache">	<meta http-equiv="cache-control" content="no-cache">	<meta http-equiv="expires" content="0">    	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">	<meta http-equiv="description" content="This is my page">	<link href="css/bootstrap.min.css" rel="stylesheet">	<script src="http://code.jquery.com/jquery-latest.js"></script>	<script src="js/bootstrap.min.js"></script>	 <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>	<!--	<link rel="stylesheet" type="text/css" href="styles.css">	-->  </head>   <body>   <form class="form-inline" name="searchForm">    <select class="form-control" id="searchCondition"> <option value="1">学号</option> <option value="2">姓名</option> </select>    <div class="input-group">     <input type="text" name="inputCondition" class="form-control" placeholder="InPutInfo" />    </div>    <input type="button" class="btn btn-primary" onclick="verify()" value="Search">  </form>   <hr> <div id="tableDiv" style="display: none">  <table  id="table"  class="table table-striped" >          <tr id="tr">              <td>学号</td>              <td>姓名</td>              <td>性别</td>            <td>班级</td>              <td>宿舍号</td>            <td>操作</td>        </tr>       </table>  </div><div id="showError" style=" display: none; text-align: center;">查询信息不存在</div><div id="showNull" style=" display: none; text-align: center;">不能为空</div><div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  <div class="modal-dialog" role="document">    <div class="modal-content">      <div class="modal-header">        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        <h4 class="modal-title" id="myModalLabel">寝室管理</h4>      </div>			<div class="form-group has-feedback" id="DromNoDiv">    			<label for="inputDromNo" class="control-label">更改宿舍号</label>    			<input class="inputSize" type="text" name="inputDromNo" class="form-control" id="inputDromNo">    			<span class=" glyphicon glyphicon-ok form-control-feedback display-point" id="dromNoSuccess"></span>    			<span class=" glyphicon glyphicon-remove form-control-feedback display-point" id="dromNoFalse"></span>    			<div class="label-text display-point" id="label-sign"> </div>    		</div>      <div class="modal-footer">        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>        <button type="button" class="btn btn-primary" id="dromChange" data-dismiss="modal">确认</button>      </div>    </div>  </div></div> </body>		<style type="text/css">		.display-point{  		display: none;  	}  	.inputSize{  		margin-left: 50px;  		width: 400px;  	}	</style> <script type="text/javascript"> 	var xmlhttp; 	var table=document.getElementById('table');   	var tableDiv=document.getElementById('tableDiv');   	function verify(){  		var obj = document.getElementById("searchCondition").value; 				//var selected_val = obj.options[obj.selectedIndex].value;		var iCondition = document.searchForm.inputCondition.value;		if(iCondition!= ""){	  if(window.ActiveXObject){   //是IE浏览器  	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  	  	            }else if(window.XMLHttpRequest){    //除IE外的其他浏览器  	  	                xmlhttp = new XMLHttpRequest();  	            }        	            xmlhttp.withCredentials = true;	            xmlhttp.onreadystatechange = function() {         		  		 	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){						var back =xmlhttp.responseText;						var showNull = document.getElementById("showNull");						if(back != "null"){						showNull.style.display="none";						showError.style.display="none";		  		 		tableDiv.style.display="block";		  		 		$("#table  tr:not(:first)").remove();												var sd = eval("("+back+")"); 						var arr = new Array();						var i = 0;												for(var a in sd.stuBena){ 							var count = 0;							i++;													$("#table tbody").append('<tr><td></td><td></td><td></td><td></td><td></td> <td><button class="btn btn-sm btn-warning" id="stuUpdate" data-toggle="modal" data-target="#updateModal" value="'+i+'" onclick="btuUpdate(this);">寝室编辑</button></td> </tr>');																	table.rows[i].cells[count].innerHTML = sd.stuBena[a].stuNo;							table.rows[i].cells[count+1].innerHTML = sd.stuBena[a].stuName;							table.rows[i].cells[count+2].innerHTML = sd.stuBena[a].stuSex;							table.rows[i].cells[count+3].innerHTML = sd.stuBena[a].sutClass;							table.rows[i].cells[count+4].innerHTML = sd.stuBena[a].stuDromNo;							//for( var item in sd.stuBena[a]){							//	count++;							//	var p = sd.stuBena[a][item];							//	table.rows[i].cells[count-1].innerHTML = p;							//}							}		  		 		}else if(back == "null"){		  		 				tableDiv.style.display="none";		  		 				showError.style.display="block";		  		 				showNull.style.display="none";		  		 		}		  		 			  		 }		  	}		  		xmlhttp.open("GET", "servlet/stuSearch?option="+obj+"&inputCondition="+iCondition , true);		  	    xmlhttp.send(); 			}else{								tableDiv.style.display="none";		  		 				showError.style.display="none";		  		 				showNull.style.display="block";	}} 			$("#inputDromNo").blur(function(){  		if($("#inputDromNo").val()!=""){  			$.ajax({  				type:'GET',  				url:'servlet/checkDromSlot?DromNo='+$("#inputDromNo").val(),  				success:function(data){  					if(data == "1"){  						dromJudge = true;  						$("#DromNoDiv").removeClass("has-error");  						$("#DromNoDiv").addClass("has-success");  						$("#dromNoSuccess").css("display","block");  						$("#dromNoFalse").css("display","none");  						$("#label-sign").css("display","none");  					}  						 if(data == "2"){  						 	dromJudge = false;	  						$("#DromNoDiv").removeClass("has-success");	  						$("#DromNoDiv").addClass("has-error");	  						$("#dromNoSuccess").css("display","none");	  						$("#dromNoFalse").css("display","block");	  						$("#label-sign").html("");	  						$("#label-sign").append("该宿舍已满");	  						$("#label-sign").css("display","block");  						}  							 if(data == "3"){  							 	dromJudge = false;  							 	$("#DromNoDiv").removeClass("has-success");		  						$("#DromNoDiv").addClass("has-error");		  						$("#dromNoSuccess").css("display","none");		  						$("#dromNoFalse").css("display","block");		  						$("#label-sign").html("");		  						$("#label-sign").append("不存在该宿舍");		  						$("#label-sign").css("display","block");	  				  							}  				}  			});  		}else{  								dromJudge = false;  								$("#DromNoDiv").removeClass("has-success");		  						$("#DromNoDiv").addClass("has-error");		  						$("#dromNoSuccess").css("display","none");		  						$("#dromNoFalse").css("display","block");		  						$("#label-sign").html("");		  						$("#label-sign").append("宿舍号不能为空");		  						$("#label-sign").css("display","block");		  						//宿舍号不能为空  		}  	});function btuUpdate(obj){	$("#dromChange").click(function(){  						if($("#inputDromNo").val!=""&&dromJudge==true){  								$.ajax({  									type:'GET',  									data:{stuNo:table.rows[obj.value].cells[0].innerHTML,dromNo:$("#inputDromNo").val()},  									url:'servlet/stuChangeDrom',  									success:function(data){  										verify();  									}  								});  						}else{  							alert("请填写正确的信息");  							return false;  						}					});  				}  				  			 </script></html>