package Controlador;

import DTO.Habitaciones;
import Servicios.wshabitacionAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "CtrlHabitaciones", urlPatterns = {"/CtrlHabitaciones"})
public class CtrlHabitaciones extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

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
                case "showAddForm":
                    showAddForm(request, response);
                    break;
                case "showEditForm":
                    showEditForm(request, response, token);
                    break;
                default:
                    handleGet(request, response, token);
                    break;
            }
        }
    }

    private void handleGet(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        wshabitacionAuth wsRoom = new wshabitacionAuth();

        try {
            List<Habitaciones> habitaciones = wsRoom.consultar(token);
            request.setAttribute("lstHabitaciones", habitaciones);
            RequestDispatcher rd = request.getRequestDispatcher("Habitaciones.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("Login.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handlePost(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        String typehabitacion = request.getParameter("typehabitacion");
        float precioxnoche = Float.parseFloat(request.getParameter("precioxnoche"));
        String estado = request.getParameter("estado");

        Habitaciones habitacion = new Habitaciones(0, typehabitacion, precioxnoche, estado);

        wshabitacionAuth wsRoom = new wshabitacionAuth();

        try {
            wsRoom.insertar(token, habitacion);
            response.sendRedirect("CtrlHabitaciones");
        } catch (Exception ex) {
            response.sendRedirect("Habitaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idhabitacion = Integer.parseInt(request.getParameter("idhabitacion"));
        String typehabitacion = request.getParameter("typehabitacion");
        float precioxnoche = Float.parseFloat(request.getParameter("precioxnoche"));
        String estado = request.getParameter("estado");

        Habitaciones habitacion = new Habitaciones(idhabitacion, typehabitacion, precioxnoche, estado);

        wshabitacionAuth wsRoom = new wshabitacionAuth();

        try {
            wsRoom.modificar(token, idhabitacion, habitacion);
            response.sendRedirect("CtrlHabitaciones");
        } catch (Exception ex) {
            response.sendRedirect("Habitaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idhabitacion = Integer.parseInt(request.getParameter("idhabitacion"));

        wshabitacionAuth wsRoom = new wshabitacionAuth();

        try {
            wsRoom.eliminar(token, idhabitacion);
            response.sendRedirect("CtrlHabitaciones");
        } catch (Exception ex) {
            response.sendRedirect("Habitaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("Habitaciones.jsp");
        rd.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idhabitacion = Integer.parseInt(request.getParameter("idhabitacion"));

        wshabitacionAuth wsRoom = new wshabitacionAuth();
        Habitaciones habitacion = wsRoom.consultar(token).stream().filter(h -> h.getIdhabitacion() == idhabitacion).findFirst().orElse(null);
        if (habitacion != null) {
            request.setAttribute("habitacion", habitacion);
            RequestDispatcher rd = request.getRequestDispatcher("Habitaciones.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("CtrlHabitaciones?error=notfound");
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
        return "CtrlHabitaciones Servlet";
    }
}
