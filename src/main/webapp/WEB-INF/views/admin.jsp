<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SuperCine | Bienvenido</title>
    
    <spring:url value="/resources" var="assets" />
    <spring:url value="/" var="root" />
    
    <link href="${assets}/css/materialize.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="${assets}/css/style.css" rel="stylesheet">
</head>

<body>
   
   <jsp:include page="includes/nav.jsp"></jsp:include>

        <br><br>
    <!--Contenido principal-->
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h2 class="header">Administración del Sistema</h2>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="${assets}/images/admin.jpg">
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>Bienvenido(a) usuario <strong><sec:authentication property="principal.username" /></strong>.</p>
                        </div>
                        <div class="card-action">
                            <a href="${root}admin/logout">Cerrar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Fin de contenido principal-->

    <br><br>
    <br><br>
    <br><br>
    <br><br>
    
    <jsp:include page="includes/footer.jsp"></jsp:include>

   <script src="${assets}/js/jquery.min.js"></script>
   <script src="${assets}/js/materialize.min.js"></script>
   <script src="${assets}/js/main.js"></script>
</body>

</html>