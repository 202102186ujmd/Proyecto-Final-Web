package DTO;
import java.time.LocalDate;
import jakarta.json.bind.annotation.JsonbDateFormat;

public class Reservaciones {
    private int idreserva;
    private int idcliente;
    private int idhabitacion;

    @JsonbDateFormat("yyyy-MM-dd")
    private LocalDate fecha_inicio;

    @JsonbDateFormat("yyyy-MM-dd")
    private LocalDate fecha_fin;

    private String estado;

    public Reservaciones() {}

    public Reservaciones(int idreserva, int idcliente, int idhabitacion, LocalDate fecha_inicio, LocalDate fecha_fin, String estado) {
        this.idreserva = idreserva;
        this.idcliente = idcliente;
        this.idhabitacion = idhabitacion;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.estado = estado;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getIdhabitacion() {
        return idhabitacion;
    }

    public void setIdhabitacion(int idhabitacion) {
        this.idhabitacion = idhabitacion;
    }

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public LocalDate getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(LocalDate fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return this.idreserva + " " + this.idcliente + " " + this.idhabitacion + " " + this.fecha_inicio + " " + this.fecha_fin + " " + this.estado + " ";
    }
}
