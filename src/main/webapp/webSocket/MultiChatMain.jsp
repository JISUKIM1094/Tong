<%@page import="utils.JSFunction"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>웹소켓 채팅</title></head>
<body>
    <script>
    function chatWinOpen() {
        var id = document.getElementById("chatId");
        if (id.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요.");
            id.focus();
            return;
        }else {
        	alert("채팅시작");
	        <%
				int a=1; 
				//request.setAttribute("chat", "ing");
	    	%>
	    	
	        window.open("webSocket/ChatWindow.jsp?chatId=" + id.value, "", "width=320,height=400");
	         <%-- <%@ include file="./MultiChatMain.jsp" %>  --%>
	        id.value = "";
        }
    }
    </script>
    <!-- <h2>웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
    
    대화명 :  --><input type="text" id="chatId" />
    <button onclick="chatWinOpen();">채팅 참여</button>
    
</body>
</html>
