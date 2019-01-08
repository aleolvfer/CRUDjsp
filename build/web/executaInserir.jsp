<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cadastro"%>
<%@page import="dao.ProdutoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page21</title>
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
                    pd.inserir(cd);
                    response.sendRedirect("index.jsp"); 
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 7:"+ erro);
            }
        
        %>
        
        
    </body>
</html>
