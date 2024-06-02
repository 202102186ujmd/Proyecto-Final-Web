package Servicios;

import DTO.Habitaciones;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

public class wshabitacionAuth {

    private WebTarget wt;
    private Client room;

    public wshabitacionAuth() {
        String url = "http://localhost:8080/ProyectoAPIWS/webresources/";
        this.room = ClientBuilder.newClient();
        this.wt = this.room.target(url).path("Habitaciones");
    }

    public List<Habitaciones> consultar(String token) {
        return this.wt.request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .get(new GenericType<List<Habitaciones>>(){}); 
    }

    public void insertar(String token, Habitaciones habitacion) {
        this.wt.request(MediaType.APPLICATION_JSON)
               .header("Authorization", token)
               .post(Entity.entity(habitacion, MediaType.APPLICATION_JSON));
    }
    
    public void modificar(String token, int id, Habitaciones habitacion) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        this.wt.path(path)
               .request(MediaType.APPLICATION_JSON)
               .header("Authorization", token)
               .put(Entity.entity(habitacion, MediaType.APPLICATION_JSON));
    }

    public void eliminar(String token, int id) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        this.wt.path(path)
               .request(MediaType.APPLICATION_JSON)
               .header("Authorization", token)
               .delete();
    }
}
