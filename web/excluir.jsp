<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        
        <form action="executaExcluir.jsp" method="post">
            
        
            <label>ID:</label><br/>
            <input type="text" name="id" values="<%=request.getParameter("id")%>"/><br/>
        
            <label>Nome:</label><br/>
            <input type="text" name="Nome" values="<%=request.getParameter("Nome")%>"/><br/>
            
            <button type="submit"> OK </button>     
        </form>


    </body>
</html>
