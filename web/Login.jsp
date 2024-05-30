<%-- 
    Document   : Login
    Created on : may 2024
    Author     : Pedro Navarrete
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="CSS/logincss.css">
        <title>Inicio de Sesion</title>

    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="CtrlLogin?accion=2" method="POST">
                    <h1>Crea un Cuenta</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span> use un Email para registrarse</span>
                    <input name="nombre" type="text" placeholder="Nombre">
                    <input name="apell" type="text" placeholder="Apellido">
                    <input name="emailr" type="text" placeholder="Email">
                    <input name="passwordr" type="password" placeholder="Password">
                    <button type="submit" value="Aceptar">Crear Cuenta</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form action="CtrlLogin?accion=1" method="POST">
                    <h1>Iniciar Sesión</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>Utlice su Email para inciar sesión</span>
                    <input name="email" type="text" placeholder="Email">
                    <input name="password" type="text" placeholder="Password">
                    <a href="#">Olvidaste tu constraseña???</a>
                    <button type="submit" value="Aceptar">Iniciar Sesión</button>

                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Bienvenido!!!</h1>
                        <p>Ingrese sus datos personales para utilizar todas las funciones del sitio</p>
                        <button class="hidden" id="login">Iniciar Sesión</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Bienvenido!</h1>
                        <p>Regístrese con sus datos personales para utilizar todas las funciones del sitio</p>
                        <button class="hidden" id="register">Crear una cuenta</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="error-message" class="error-message hidden"></div>

        <script>
            const container = document.getElementById('container');
            const registerBtn = document.getElementById('register');
            const loginBtn = document.getElementById('login');

            registerBtn.addEventListener('click', () => {
                container.classList.add("active");
            });

            loginBtn.addEventListener('click', () => {
                container.classList.remove("active");
            });
            <% 
            String errorMessage = (String)request.getAttribute("errorMessage"); 
            if(errorMessage != null) { 
            %>
            document.getElementById('error-message').innerHTML = '<%= errorMessage %>';
            document.getElementById('error-message').classList.remove('hidden');
             <%
              }
             %>
            
        </script>
        
    </body>
</html>
