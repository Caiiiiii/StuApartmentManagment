<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dromDelete.jsp' starting page</title>
    
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
     <form class="form-inline" name="searchForm"> 
   	<label for="inputDromNo"></label>
    <input type="text" name="inputDromNo" class="form-control" placeholder="InPutInfo" id="inputDromNo" /> 
   </div> 
   <input type="button" class="btn btn-primary" id="searchBtn"
   value="Search" onclick="verify()">
  </form>

	<hr>

  <div id="tableDiv" style="display: none">
  <table  id="table"  class="table table-striped" >  
        <tr id="tr">  
            <td>宿舍号</td>  
            <td>宿舍楼</td>  
            <td>楼层</td>
            <td>房间</td>
            <td>入住人数</td>
            <td>操作</td>
        </tr>   
    </table>  
</div>
<div id="showError" style=" display: none; text-align: center;">查询信息不存在</div>
<div id="showNull" style=" display: none; text-align: center;">不能为空</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">警告!</h4>
      </div>
      <div class="modal-body" id="showName">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="checkOn" data-dismiss="modal">确认</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

	function verify(){
			if($("#inputDromNo").val()!=""){
				$.ajax({
			type:'GET',
			url:'servlet/dromSearch?dromNo='+$("#inputDromNo").val(),
			success:function(data){
				if(data != "null"){
					showNull.style.display="none";
					showError.style.display="none";
		  		 	tableDiv.style.display="block";
		  		 	$("#table  tr:not(:first)").remove();

		  		 	var sd = eval("("+data+")");
		  		 	var i = 0; var count = 0;
		  		 	for(var a in sd.DromBean){
		  		 		i++;

		  		 		$("#table tbody").append('<tr><td></td><td></td><td></td><td></td><td></td><td>  <button class="btn btn-danger" id="stuDel" data-toggle="modal" data-target="#myModal" value="'+sd.DromBean[a].dromNo+'" onclick="btuDel(this);">删除</button></td></tr>');

		  		 			table.rows[i].cells[count].innerHTML = sd.DromBean[a].dromNo;
		  		 			table.rows[i].cells[count+1].innerHTML = sd.DromBean[a].building;
							table.rows[i].cells[count+2].innerHTML = sd.DromBean[a].floor;
							table.rows[i].cells[count+3].innerHTML = sd.DromBean[a].room;
							table.rows[i].cells[count+4].innerHTML = sd.DromBean[a].freeSlot;
		  		 	}
				}else if(data == "null"){
								showNull.style.display="none";
		  		 				tableDiv.style.display="none";
		  		 				showError.style.display="block";
		  		 		}
				}

				});
			}else{
				tableDiv.style.display="none";
				showNull.style.display="block";
				showError.style.display="none";
			}
		
	}
		

	function btuDel(obj){
			$("#showName").text("是否删除宿舍号为"+obj.value+"的宿舍的信息?");
			$("#checkOn").click(function(){
				$.ajax({
					type:'GET',
					url:'servlet/dromDelete?dromNo='+obj.value,
					success:function(data){
						if(data == "1"){	
							verify();

						}
						else if (data == "2"){
	
						}
					}
				});
			});
	}



</script>
  </body>
</html>
