package Servicios;

import DTO.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;

public class wsUsuarioAuth {

    private WebTarget wt;
    private Client cliente;

    public wsUsuarioAuth() {
        String url = "http://localhost:8080/ProyectoAPIWS/webresources/";
        this.cliente = ClientBuilder.newClient();
        this.wt = this.cliente.target(url).path("Usuarios");
    }

    public List<Usuario> consultar(String token) {
        return this.wt.request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .get(new GenericType<List<Usuario>>(){});
    }

    public Usuario consultarPorUsername(String token, String username) {
        return this.wt.path(username)
                      .request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .get(new GenericType<Usuario>(){});
    }

    public Response insertar(String token, Usuario usuario) {
        return this.wt.request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .post(Entity.entity(usuario, MediaType.APPLICATION_JSON));
    }

    public Response modificar(String token, String username, Usuario usuario) {
        return this.wt.path(username)
                      .request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .put(Entity.entity(usuario, MediaType.APPLICATION_JSON));
    }

    public Response eliminar(String token, String username) {
        return this.wt.path(username)
                      .request(MediaType.APPLICATION_JSON)
                      .header("Authorization", token)
                      .delete();
    }
}
