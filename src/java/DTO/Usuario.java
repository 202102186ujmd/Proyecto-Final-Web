package DTO;
/**
 * Universidad Dr. Jose Matias Delgado
 * Catedra Programacion de computadoras 4
 * @author Pedro Navarrete
 *          202102186
 */
public class Usuario {
    private String username;
    private String password;
    private int typeuser;

    public Usuario() {
    }

    public Usuario(String username, String password, int typeuser) {
        this.username = username;
        this.password = password;
        this.typeuser = typeuser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getTypeuser() {
        return typeuser;
    }

    public void setTypeuser(int typeuser) {
        this.typeuser = typeuser;
    }    
}
