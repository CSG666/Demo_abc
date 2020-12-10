<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#name{
color:red;
}
</style>
<script type="text/javascript">
		function abc(){

			var xmlHttp;//变量：对象
			 try{//ajax对不同浏览器的兼容性问题
			   		// Firefox, Opera 8.0+, Safari 支持不同的浏览器（谷歌）
			    	xmlHttp=new XMLHttpRequest();
			    }catch (e){
			  		// Internet Explorer 支持IE版本
				   try{
				      	xmlHttp=new ActiveXObject("Msxml2.XMLHTTP"); //高版本：9以上
				      }catch (e){	      
				    	  try{
				         	xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");//低版本： 5，6
				         }catch (e){
				         	alert("您的浏览器不支持AJAX！");
				         	return false;
				         }
				      }
			    }
			    xmlHttp.onreadystatechange=function(){
					 //向服务器请求完成后的状态码：4
					 if(xmlHttp.readyState==4){
						  var rtxt= xmlHttp.responseText;//servlet返回的流 接收的方式  湖南,长沙
						 document.getElementById("name").innerHTML=rtxt;
					 }
				 }
				 var code=document.getElementById("code").value;
				 //alert("code:"+code);
				 //向服务器，建立连接,给定指令
				 xmlHttp.open("GET","ajax?code="+code,true);
				 //向服务器发送请求  null  后面写json数据
				 xmlHttp.send(null);

			    
		}
</script>
</head>
<body>
   <label>用户名：</label>
   <input type="text" id="code" onblur=" abc()" />
	<span id="name"></span>
</body>
</html>