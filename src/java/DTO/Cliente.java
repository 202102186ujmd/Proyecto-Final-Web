package DTO;
/**
 * Universidad Dr. Jose Matias Delgado
 * Catedra Programacion de computadoras 4
 * @author Pedro Navarrete
 *          202102186
 */
public class Cliente {
    private int idcliente;
    private String nombre;
    private String apellido;
    private String email;

    public Cliente() {
    }

    public Cliente(int idcliente, String nombre, String apellido, String email) {
        this.idcliente = idcliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }
    
    // Constructor sin idCliente
    public Cliente(String nombre, String apellido, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }
    

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return this.idcliente + " " + this.nombre + " " + this.apellido + " " + this.email + " ";
    }
}
