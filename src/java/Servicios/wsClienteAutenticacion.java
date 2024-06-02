 package Servicios;

import jakarta.ws.rs.ClientErrorException;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;


public class wsClienteAutenticacion {

    private WebTarget webTarget;
    private Client client; 
    private static final String BASE_URI = "http://localhost:8080/ProyectoAPIWS/webresources/";

    public wsClienteAutenticacion() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("Login");
    }

    public wsClienteAutenticacion(String username, String password) {
        this();
        setUsernamePassword(username, password);
    }
   
    public String validar(Object requestEntity) throws ClientErrorException {
        return webTarget.request(MediaType.APPLICATION_JSON).post(Entity.entity(requestEntity,MediaType.APPLICATION_JSON), String.class);
    }

    public void close() {
        client.close();
    }

    public final void setUsernamePassword(String username, String password) {
        //webTarget.register(new org.glassfish.jersey.client.filter.HttpBasicAuthFilter(username, password));
    }
    
}