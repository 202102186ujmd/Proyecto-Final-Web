package DTO;
/**
 * Universidad Dr. Jose Matias Delgado
 * Catedra Programacion de computadoras 4
 * @author Pedro Navarrete
 *          202102186
 */
public class Habitaciones {
    private int idhabitaion;
    private String typehabitacion;
    private float precioxnoche;
    private String estado;

    public Habitaciones() {
    }

    public Habitaciones(int idhabitaion, String typehabitacion, float precioxnoche, String estado) {
        this.idhabitaion = idhabitaion;
        this.typehabitacion = typehabitacion;
        this.precioxnoche = precioxnoche;
        this.estado = estado;
    }

    public int getIdhabitaion() {
        return idhabitaion;
    }

    public void setIdhabitaion(int idhabitaion) {
        this.idhabitaion = idhabitaion;
    }

    public String getTypehabitacion() {
        return typehabitacion;
    }

    public void setTypehabitacion(String typehabitacion) {
        this.typehabitacion = typehabitacion;
    }

    public float getPrecioxnoche() {
        return precioxnoche;
    }

    public void setPrecioxnoche(float precioxnoche) {
        this.precioxnoche = precioxnoche;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return this.idhabitaion + " " + this.typehabitacion + " " + this.precioxnoche + " " + this.estado + " " ;
    }
}
