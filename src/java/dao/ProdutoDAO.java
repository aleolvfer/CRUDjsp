package dao;

import model.Cadastro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ProdutoDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Cadastro> lista = new ArrayList<>();
            
    public ProdutoDAO(){
      conn = new ConnectionFactory().getConnection();
    }
    
    public void inserir(Cadastro cadastro){
        String sql ="INSERT INTO Cadastro (Nome) VALUES (?)";
        
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cadastro.getNome());
            stmt.execute();
            stmt.close();
            
            
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 2: "+erro);
        }
    }
    
    
    public void alterar(Cadastro cadastro){
        String sql ="UPDATE Cadastro SET Nome = ? WHERE id = ?";
        
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cadastro.getNome());
            stmt.setInt(2, cadastro.getCod());
            stmt.execute();
            stmt.close();
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 3: "+erro);
        }
    }
    
    
    
    public void excluir(int valor){
        String sql ="DELETE FROM Cadastro WHERE id = "+valor;
        
        try{
            st = conn.createStatement();
            st.execute(sql);
            st.close();
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 4 : "+erro);
        }
    }
    
    
    public ArrayList<Cadastro> listarTodos(){
        String sql = "SELECT * FROM Cadastro";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Cadastro cadastro = new Cadastro();
                cadastro.setCod(rs.getInt("id"));
                cadastro.setNome(rs.getString("Nome"));
                lista.add(cadastro);
           }
        }catch(Exception erro){
             throw new RuntimeException("Erro 5 : "+erro);
           
        }
        return lista;
    }
    
    
    
    public ArrayList<Cadastro> listarTodosDescricao(String valor){
        String sql = "SELECT * FROM Cadastro WHERE Nome LIKE '%"+valor+"%'";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Cadastro cadastro = new Cadastro();
                cadastro.setCod(rs.getInt("id"));
                cadastro.setNome(rs.getString("Nome"));
                lista.add(cadastro);
           }
        }catch(Exception erro){
             throw new RuntimeException("Erro 6 : "+erro);
           
        }
        return lista;
    }
    
    
}
