package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dominio.Usuarios;
import dominio.UsuarioTarea;
import datos.ClienteDao;
import java.util.List;

@WebServlet("/ServletLogin")

public class ServletLogin extends HttpServlet {

    String accion = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        accion = request.getParameter("accion");

        switch (accion) {

            case "validar":

                

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        accion = request.getParameter("accion");

        switch (accion) {

            case "validar":
                this.validar(request, response);

                break;

        }

    }

    public void validar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String usuario = request.getParameter("documento");
        String contraseña = request.getParameter("contraseña");

        Usuarios usuarioIngreso = new ClienteDao().buscarDatosId(usuario, contraseña);

        if (usuarioIngreso != null) {
            HttpSession sesion = request.getSession();
            
            List<UsuarioTarea> listaUsuarios =  new ClienteDao().buscarTareas(usuarioIngreso);
            
            request.setAttribute("listaTareas", listaUsuarios);

            sesion.setAttribute("usuario", usuarioIngreso);

            String jspEditar = "principal.jsp";
            request.getRequestDispatcher(jspEditar).forward(request, response);
            

        }else{
            
             String jspEditar = "login.jsp";
            request.getRequestDispatcher(jspEditar).forward(request, response);
            
        }

    }
    
    
    public void consultarTareas(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        
        
    }

}
