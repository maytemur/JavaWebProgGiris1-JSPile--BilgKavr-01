<%-- 
    Document   : alakasiz
    Created on : Sep 13, 2022, 2:17:19 PM
    Author     : maytemur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!--Bu kodlar server tarafında session olarak tutulacak-->
        
        <%
           HttpSession oturum= request.getSession();
           String sessionaGelen=(String) oturum.getAttribute("oturumismi");
           //obje olarak geldiği için typecast yaparak string'e çevirdik
           out.print(" oturumdan gelen isim : "+sessionaGelen);
           //örneğin alışveriş sepeti bilgileri bu şekilde session'a atıp gidilen sayfalardan
           //bu session dosyası ile bilgilere erişebiliriz.        
        %>
    </body>
</html>
