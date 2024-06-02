package Servicios;

import DTO.Reservaciones;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

public class wsReservacionesAuth {

    private WebTarget wt;
    private Client reservaciones;

    public wsReservacionesAuth() {
        String url = "http://localhost:8080/ProyectoAPIWS/webresources/";
        this.reservaciones = ClientBuilder.newClient();
        this.wt = this.reservaciones.target(url).path("Reservas");
    }

    public List<Reservaciones> consultar(String token) {
        return this.wt.request(MediaType.APPLICATION_JSON).header("Authorization", token).get(new GenericType<List<Reservaciones>>(){}); 
    }

    public void insertar(String token, Reservaciones res) {
        this.wt.request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .post(Entity.entity(res, MediaType.APPLICATION_JSON));
    }
    
    public void modificar(String token, int id, Reservaciones res) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        System.out.println("Enviando solicitud de modificación para ID: " + id + " con token: " + token);
        System.out.println("Datos de la reserva a modificar: " + res);
        this.wt.path(path)
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .put(Entity.entity(res, MediaType.APPLICATION_JSON));
    }

    public void eliminar(String token, int id) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        this.wt.path(path)
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .delete();
    }
}
