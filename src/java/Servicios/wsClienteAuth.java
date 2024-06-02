package Servicios;

import DTO.Cliente;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

public class wsClienteAuth {

    private WebTarget wt;
    private Client cliente;

    public wsClienteAuth() {
        String url = "http://localhost:8080/ProyectoAPIWS/webresources/";
        this.cliente = ClientBuilder.newClient();
        this.wt = this.cliente.target(url).path("Clientes");
    }

    public List<Cliente> consultar(String token) {
        return this.wt.request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .get(new GenericType<List<Cliente>>() {
                });
    }

    public void insertar(String token, Object cli) {
        this.wt.request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .post(Entity.entity(cli, MediaType.APPLICATION_JSON));
    }

    public void modificar(String token, int id, Object cli) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        System.out.println("Enviando solicitud de modificación para ID: " + id + " con token: " + token);
        this.wt.path(path)
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .put(Entity.entity(cli, MediaType.APPLICATION_JSON));
    }

    public void eliminar(String token, int id) {
        String path = "/" + id; // Añadimos el ID al final de la URL
        this.wt.path(path)
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", token)
                .delete();
    }
}
