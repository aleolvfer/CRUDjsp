<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Cadastro"%>



<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>

        


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page index</title>
    </head>
    <body>

        <form action="index.jsp" method="post" >
            
            <input type="text" size="30" name="Nome" placeholder="Digite um nome" class="tabela" /><br/><br/>
            <!--<input type="submit" value="Enviar" />-->
            
            <button type="submit" class="id" >
                CONSULTAR
            </button>
            
        </form>
            
        <%
             try{
                 out.print("<table>");
                 out.print("<tr>");
                 out.print("<th>Id</th><th>Nome</th><th>Editar</th><th>Excluir</th>");
                 ProdutoDAO prd = new ProdutoDAO();
                 if(request.getParameter("Nome") == "" || request.getParameter("Nome") == null){
                     ArrayList<Cadastro> lista = prd.listarTodos();
                     for(int num = 0; num < lista.size(); num++){
                         out.print("<tr>");
                         out.print("<td>"+lista.get(num).getCod()+"</td>");
                         out.print("<td>"+lista.get(num).getNome()+"</td>");
                         out.print("<td><a href='alterar.jsp?id"+ lista.get(num).getCod()+"&Nome"+lista.get(num).getNome()+"'>CLIQUE</a></td>"); 
                         out.print("<td><a href='excluir.jsp?id"+ lista.get(num).getCod()+"&Nome"+lista.get(num).getNome()+"'>CLIQUE</a></td>");                          
                         out.print("</tr>"); 
                         
                     }
                 }else{
                     ArrayList<Cadastro> lista = prd.listarTodosDescricao(request.getParameter("Nome"));
                     for(int num = 0; num < lista.size(); num++){
                         out.print("<tr>");
                         out.print("<td>"+lista.get(num).getCod()+"</td>");
                         out.print("<td>"+lista.get(num).getNome()+"</td>");
                         out.print("<td><a href='alterar.jsp?id"+ lista.get(num).getCod()+"&Nome"+lista.get(num).getNome()+"'>CLIQUE</a></td>"); 
                         out.print("<td><a href='excluir.jsp?id"+ lista.get(num).getCod()+"&Nome"+lista.get(num).getNome()+"'>CLIQUE</a></td>");                          
                         out.print("</tr>"); 
                          
                     }
                 }
                 
                 out.print("</tr>");
                 
             }catch(Exception erro){
                 throw new RuntimeException("Erro 10:"+ erro);
             }

        %>
        <br/><br/>
        <a href="inserir.jsp" class="id"> NOVO CADASTRO</a>
        <br/><br/>
    </body>
</html>
