package Controlador;

import DTO.Cliente;
import DTO.Usuario;
import Servicios.wsClienteAutenticacion;
import Servicios.wsClienteAuth;
import Servicios.wsUsuarioAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CtrlLogin", urlPatterns = {"/CtrlLogin"})
public class CtrlLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            //Inicio de sesión de usuario
            if ("1".equals(accion)) {
                String us, pss;
                us = request.getParameter("email");
                pss = request.getParameter("password");
                int ty = 1;
                Usuario usser = new Usuario(us, pss, ty);
                try {
                    wsClienteAutenticacion aut = new wsClienteAutenticacion();
                    String token = aut.validar(usser);
                    System.out.println(token);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("token", token);
                    response.sendRedirect("CtrlUsuario");
                } catch (Exception ex) {
                    response.sendRedirect("Login.jsp?error");
                    System.out.println("Error " + ex.getMessage());
                }
            }
            //Creación de usuario
            else if ("2".equals(accion)) {
                String us, pss, nombre, apell;
                nombre = request.getParameter("nombre");
                apell = request.getParameter("apell");
                us = request.getParameter("emailr");
                pss = request.getParameter("passwordr");
                int ty = 1;
                Usuario usser = new Usuario(us, pss, ty);
                Cliente cli = new Cliente(nombre, apell, us);
                try {
                    wsUsuarioAuth aut = new wsUsuarioAuth();
                    aut.insertar(usser);  
                    wsClienteAuth cliAtuth = new wsClienteAuth();
                    cliAtuth.insertar(cli);
                    response.sendRedirect("Login.jsp?success");
                } catch (Exception ex) {
                    response.sendRedirect("Login.jsp?error");
                    System.out.println("Error " + ex.getMessage());
                }
            } else {
                rd.forward(request, response);
            }
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
        return "Short description";
    }
}
