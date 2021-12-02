
package datos;


import dominio.UsuarioTarea;
import dominio.Usuarios;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;



public class ClienteDao {
    
    
    
    
    public Usuarios buscarDatosId(String usuario,String contraseña) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuarios resultado = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM usuario where documento=? and contraseña=?");
            stmt.setString(1,usuario );
            stmt.setString(2,contraseña );
            rs = stmt.executeQuery();
          
            while(rs.next()){
                int idUsuario = rs.getInt("idUsuario");
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String telefono = rs.getString("telefono");
            String documento1 = rs.getString("documento");
            String contraseña1 = rs.getString("contraseña");
            
            
            resultado = new Usuarios(idUsuario,nombre,apellido,telefono,documento1,contraseña1);
          
                
                
                
            }
            

            
            

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return resultado;
        
      
    }
    
    
    public List<UsuarioTarea> buscarTareas(Usuarios usuario) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuarios resultado = null;
        List<UsuarioTarea> listaTareas = new ArrayList<>();
        
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM usuarioactividad inner join actividad on actividad.idTarea=usuarioactividad.idActividad inner join usuario on usuario.idUsuario=usuarioactividad.idUsuario where usuario.idUsuario=?");
            stmt.setInt(1,usuario.getIdUsuario() );
            
            rs = stmt.executeQuery();
            
            
            
            
            
          
            while(rs.next()){
                
                int idUsuarioTarea=rs.getInt("idUsuarioTarea");
                String actividad=rs.getString("actividad");
                String descripcion = rs.getString("descripcion");
                String fecha = rs.getString("fecha");
                int estado= rs.getInt("estado");
                
                UsuarioTarea tarea = new UsuarioTarea(idUsuarioTarea,fecha,actividad,descripcion,estado);
                listaTareas.add(tarea);
                
                
                
                
                
                
                
                
                
                
               
                
          
                
                
                
            }
            

            
            

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return listaTareas;
        
      
    }
    
    
    
}
