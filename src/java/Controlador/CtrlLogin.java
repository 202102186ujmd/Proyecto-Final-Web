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
            
            if ("1".equals(accion)) {
                // Inicio de sesión de usuario
                String us = request.getParameter("email");
                String pss = request.getParameter("password");
                int ty = 1;
                Usuario usser = new Usuario(us, pss, ty);
                try {
                    wsClienteAutenticacion aut = new wsClienteAutenticacion();
                    String token = aut.validar(usser);
                    System.out.println(token);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("token", token);
                    //response.sendRedirect("CtrlClientes");
                    //response.sendRedirect("CtrlReservaciones");
                    response.sendRedirect("CtrlHabitaciones");
                } catch (Exception ex) {
                    response.sendRedirect("Login.jsp?error");
                    System.out.println("Error " + ex.getMessage());
                }
            } else if ("2".equals(accion)) {
                // Creación de usuario
                String us = request.getParameter("emailr");
                String pss = request.getParameter("passwordr");
                String nombre = request.getParameter("nombre");
                String apell = request.getParameter("apell");
                int ty = 1;
                Usuario usser = new Usuario(us, pss, ty);
                Cliente cli = new Cliente(nombre, apell, us);
                try {
                    // Agregar lógica de creación de usuario si es necesario
                } catch (Exception ex) {
                    response.sendRedirect("Login.jsp?error");
                    System.out.println("Error " + ex.getMessage());
                }
            } else if ("cerrarSesion".equals(accion)) {
                // Cerrar sesión
                HttpSession sesion = request.getSession(false);
                if (sesion != null) {
                    sesion.invalidate();
                }
                response.sendRedirect("Login.jsp");
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
