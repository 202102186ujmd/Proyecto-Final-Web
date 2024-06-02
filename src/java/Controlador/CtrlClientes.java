package Controlador;

import DTO.Cliente;
import Servicios.wsClienteAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "CtrlClientes", urlPatterns = {"/CtrlClientes"})
public class CtrlClientes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //Verificacion del token y sesion
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        //Redireccion del usuario al controlador de login
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

    //Obtener la lista de clientes
    private void handleGet(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        wsClienteAuth wsCli = new wsClienteAuth();

        try {
            List<Cliente> clientes = wsCli.consultar(token);
            request.setAttribute("lstCliente", clientes);
            RequestDispatcher rd = request.getRequestDispatcher("Cliente.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("Login.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handlePost(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        Cliente cliente = new Cliente(0, nombre, apellido, email);

        wsClienteAuth wsCli = new wsClienteAuth();

        try {
            wsCli.insertar(token, cliente);
            response.sendRedirect("CtrlClientes");
            System.out.println("Creacion exitosa");
        } catch (Exception ex) {
            response.sendRedirect("Cliente.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
            System.out.println("fallo mortal creacion");
        }
    }

    //Edicion de Clientes
    private void handleEdit(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        Cliente cliente = new Cliente(id, nombre, apellido, email);

        System.out.println("Editando cliente: " + cliente);

        wsClienteAuth wsCli = new wsClienteAuth();

        try {
            wsCli.modificar(token, id, cliente);
            response.sendRedirect("CtrlClientes");
            System.out.println("Edicion exitosa");
        } catch (Exception ex) {
            response.sendRedirect("Cliente.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
            System.out.println("Fallo mortal");
        }
    }

    //eliminacion de clientes
    private void handleDelete(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        wsClienteAuth wsCli = new wsClienteAuth();

        try {
            wsCli.eliminar(token, id);
            response.sendRedirect("CtrlClientes");
        } catch (Exception ex) {
            response.sendRedirect("Cliente.jsp?error=failed");
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
        return "CtrlClientes Servlet";
    }
}
