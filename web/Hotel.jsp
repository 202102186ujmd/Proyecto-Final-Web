<%-- 
    Document   : Hotel
    Created on : 17 may 2024, 12:05:10
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Holiday Crown - Mejor hotel en Dubái</title>
        <link rel="stylesheet" href="CSS/hotel.css">
        <link rel="stylesheet" href="CSS/index.css">
    </head>
    <body>
        <header>
            <nav id="navbar" class="py-30">
                <div class="container">
                    <h1 class="logo"><a href="index.html">Hotel Zante</a></h1>
                    <ul>
                        <li><a href="index.html" class="current">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="CtrlLogin">Login</a></li>
                    </ul>
                </div>
                <div id="showcase" class="py-80">
                    <div class="container">
                        <!-- Showcase content -->
                    </div>
                </div>
            </nav>
        </header>
        
        <section class="reservation">
            <h2 style="color: #21130d;">Reservaciones</h2>
            <form action="CtrlReserva?accion=1" method="POST">
                <!-- Tipo de Habitación -->
                <label style="color: #21130d;" for="idhabitacion">Tipo de Habitación:</label>
                <select id="idhabitacion" name="idhabitacion" required>
                    <option value="1">Individual</option>
                    <option value="2">Doble</option>
                    <option value="3">Suite</option>
                </select><br><br>

                <!-- Fecha de Inicio -->
                <label style="color: #21130d;" for="fecha_inicio">Fecha de Inicio:</label>
                <input type="date" id="fecha_inicio" name="fecha_inicio" required><br><br>

                <!-- Fecha de Fin -->
                <label style="color: #21130d;" for="fecha_fin">Fecha de Fin:</label>
                <input type="date" id="fecha_fin" name="fecha_fin" required><br><br>

                <!-- Estado (oculto) -->
                <input type="hidden" id="estado" name="estado" value="pendiente">

                <!-- Botón de Envío -->
                <button type="submit" value="Aceptar">Reservar</button>
            </form>
        </section>

        <section class="features">
            <div class="feature">
                <img src="img/room.jpg" alt="Habitaciones">
                <h3>Habitaciones</h3>
            </div>
            <div class="feature">
                <img src="img/tour.jpg" alt="Paquetes turísticos">
                <h3>Paquetes turísticos</h3>
            </div>
            <div class="feature">
                <img src="img/food.jpg" alt="Comida y Bebidas">
                <h3>Comida y Bebidas</h3>
            </div>
        </section>

        <footer>
            <div class="footer-content">
                <p>Holiday Crown tiene tres hoteles y resorts en el extranjero. Ofrecemos un servicio incomparable y una hospitalidad sin igual.</p>
                <div class="quick-links">
                    <h4>Enlaces rápidos</h4>
                    <ul>
                        <li><a href="#">Habitaciones y Tarifas</a></li>
                        <li><a href="#">Paquetes turísticos</a></li>
                        <li><a href="#">Contacto</a></li>
                    </ul>
                </div>
                <div class="subscription">
                    <h4>Suscripción</h4>
                    <form>
                        <input type="email" placeholder="Ingresa tu email aquí" required>
                        <button type="submit">Notificarme</button>
                    </form>
                </div>
            </div>
        </footer>
    </body>
</html>
