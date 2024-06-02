package Controlador;

import DTO.Reservaciones;
import Servicios.wsReservacionesAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "CtrlReservaciones", urlPatterns = {"/CtrlReservaciones"})
public class CtrlReservaciones extends HttpServlet {

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
        wsReservacionesAuth wsRes = new wsReservacionesAuth();

        try {
            List<Reservaciones> reservaciones = wsRes.consultar(token);
            request.setAttribute("lstReservaciones", reservaciones);
            RequestDispatcher rd = request.getRequestDispatcher("Reservaciones.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("Login.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handlePost(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idcliente = Integer.parseInt(request.getParameter("idcliente"));
        int idhabitacion = Integer.parseInt(request.getParameter("idhabitacion"));
        LocalDate fecha_inicio = LocalDate.parse(request.getParameter("fecha_inicio"));
        LocalDate fecha_fin = LocalDate.parse(request.getParameter("fecha_fin"));
        String estado = request.getParameter("estado");
        Reservaciones reserva = new Reservaciones(0, idcliente, idhabitacion, fecha_inicio, fecha_fin, estado);

        wsReservacionesAuth wsRes = new wsReservacionesAuth();

        try {
            wsRes.insertar(token, reserva);
            response.sendRedirect("CtrlReservaciones");
        } catch (Exception ex) {
            response.sendRedirect("Reservaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idreserva = Integer.parseInt(request.getParameter("idreserva"));
        int idcliente = Integer.parseInt(request.getParameter("idcliente"));
        int idhabitacion = Integer.parseInt(request.getParameter("idhabitacion"));
        LocalDate fecha_inicio = LocalDate.parse(request.getParameter("fecha_inicio"));
        LocalDate fecha_fin = LocalDate.parse(request.getParameter("fecha_fin"));
        String estado = request.getParameter("estado");
        Reservaciones reserva = new Reservaciones(idreserva, idcliente, idhabitacion, fecha_inicio, fecha_fin, estado);

        System.out.println("Editando reserva: " + reserva);
        
        wsReservacionesAuth wsRes = new wsReservacionesAuth();

        try {
            wsRes.modificar(token, idreserva, reserva);
            response.sendRedirect("CtrlReservaciones");
            System.out.println("Edición exitosa");
        } catch (Exception ex) {
            response.sendRedirect("Reservaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
            System.out.println("Error al editar reserva");
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idreserva = Integer.parseInt(request.getParameter("idreserva"));

        wsReservacionesAuth wsRes = new wsReservacionesAuth();

        try {
            wsRes.eliminar(token, idreserva);
            response.sendRedirect("CtrlReservaciones");
        } catch (Exception ex) {
            response.sendRedirect("Reservaciones.jsp?error=failed");
            System.out.println("Error: " + ex.getMessage());
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("CrearReservacion.jsp");
        rd.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, String token)
            throws ServletException, IOException {
        int idreserva = Integer.parseInt(request.getParameter("idreserva"));

        wsReservacionesAuth wsRes = new wsReservacionesAuth();
        Reservaciones reserva = wsRes.consultar(token).stream().filter(r -> r.getIdreserva() == idreserva).findFirst().orElse(null);
        if (reserva != null) {
            request.setAttribute("reserva", reserva);
            RequestDispatcher rd = request.getRequestDispatcher("EditarReservacion.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("CtrlReservaciones?error=notfound");
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
        return "CtrlReservaciones Servlet";
    }
}
