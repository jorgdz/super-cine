<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Acerca</title>
    
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
                <h3 class="header">DETALLES DE ESTA APLICACIÓN</h3>
                <div class="card horizontal">
                    <div class="card-image">
                        <br>
                        <img src="${assets}/images/acerca.png">
                    </div>
                    <div class="card-stacked">
                        <div class="card-title">
                            <h5>DETALLES</h5>
                        </div>
                        <div class="card-content">
                            <p>Aplicación de SuperCine desarrollada por <strong>Ing. Sistemas Jorge Diaz </strong> en <strong>Java</strong></p>
                        </div>
                        <div class="card-action">
                            <a href="${root}">Inicio</a>
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