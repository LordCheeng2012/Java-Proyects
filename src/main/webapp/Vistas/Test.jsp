<%-- 
    Document   : Test
    Created on : 19/12/2024, 07:32:52 PM
    Author     : DELL CI7
--%>

<%@page import="Modelo.Modelo" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        Modelo model=new Modelo();
        String result= model.Iniciar_session("USERNAME", "PASSS");
        
        %>
        <h1><%=result%></h1>
    </body>
</html>
