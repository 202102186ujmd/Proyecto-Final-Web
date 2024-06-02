package Controlador;

import DTO.Usuario;
import Servicios.wsUsuarioAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Pedro
 */
@WebServlet(name = "CtrlUsuario", urlPatterns = {"/CtrlUsuario"})
public class CtrlUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Verificación del token y sesión
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        // Redireccion del usuario al controlador de login
        if (token == null || token.isEmpty()) {
            response.sendRedirect("Login.jsp?error=notloggedin");
            return;
        }

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            handleGet(request, response, token);
        } else {
            switch (action) {
                case "add":
                    handlePost(request, response, token);
                    break;
                case "edit":
                    handleEdit(request, response, token);
                    break;
                case "delete":
                    handleDelete(request, response, token);
                    break;
                default:
                    handleGet(request, response, token);
                    break;
            }
        }
    }

    private void handleGet(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        wsUsuarioAuth wsUsr = new wsUsuarioAuth();

        try {
            List<Usuario> usuarios = wsUsr.consultar(token);
            request.setAttribute("lstUsuario", usuarios);
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("Login.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handlePost(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int typeuser = Integer.parseInt(request.getParameter("typeuser"));
        Usuario usuario = new Usuario(username, password, typeuser);

        wsUsuarioAuth wsUsr = new wsUsuarioAuth();

        try {
            wsUsr.insertar(token, usuario);
            response.sendRedirect("CtrlUsuario");
        } catch (Exception ex) {
            response.sendRedirect("Usuario.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int typeuser = Integer.parseInt(request.getParameter("typeuser"));
        Usuario usuario = new Usuario(username, password, typeuser);

        wsUsuarioAuth wsUsr = new wsUsuarioAuth();

        try {
            wsUsr.modificar(token, username, usuario);
            response.sendRedirect("CtrlUsuario");
        } catch (Exception ex) {
            response.sendRedirect("Usuario.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        String username = request.getParameter("username");

        wsUsuarioAuth wsUsr = new wsUsuarioAuth();

        try {
            wsUsr.eliminar(token, username);
            response.sendRedirect("CtrlUsuario");
        } catch (Exception ex) {
            response.sendRedirect("Usuario.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CtrlUsuario Servlet";
    }
}
