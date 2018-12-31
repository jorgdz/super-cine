<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Sistema para gestion de cine">
    <meta name="author" content="Jorge Diaz">
    <title>Error 400</title>
    
    <spring:url value="/resources" var="assets" />
    
    <link rel="stylesheet" href="${assets}/css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${assets}/css/style.css">
</head>

<body>
    
    <jsp:include page="../includes/nav.jsp"></jsp:include>
    
    <br><br>
    <!--Contenido principal-->
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12">
                <h2 class="header">Error 400</h2>
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="${assets}/images/error.png">
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>Petición no válida.</p>
                        </div>
                        <div class="card-action">
                            <button class="btn waves-effect light-blue darken-2" type="button" onclick="goBack()">Regresar
                                <i class="material-icons right">arrow_back</i>
                            </button>
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
    <br><br>
   
   	<jsp:include page="../includes/footer.jsp"></jsp:include>

    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
    <script src="${assets}/js/back.js"></script>
</body>

</html>