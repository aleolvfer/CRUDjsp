
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cadastro"%>
<%@page import="dao.ProdutoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page2</title>
    </head>
    <body>
        
        <%
            try{
                Cadastro cd = new Cadastro();
                ProdutoDAO pd = new ProdutoDAO();
                if(request.getParameter("Nome").equals("")){
                    response.sendRedirect("index.jsp");
                        
                }else{
                    cd.setNome(request.getParameter("Nome"));
                    cd.setCod(Integer.parseInt(request.getParameter("id")));
                    pd.alterar(cd);
                    response.sendRedirect("index.jsp"); 
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 8:"+ erro);
            }
        
        %>
        
        
    </body>
</html>
