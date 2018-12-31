<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    		
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>         
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Detalles de la película</title>
    
    <spring:url value="/resources" var="assets" />
    
    <link rel="stylesheet" href="${assets}/css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${assets}/css/style.css">
</head>

<body>
   	
   	<jsp:include page="includes/nav.jsp"></jsp:include>

    <br>
    <!--Contenido principal-->
    <div class="container">
        <div class="row">
            <h4>${pelicula.titulo}</h4>
            <div class="divider"></div>
            <div class="col col s12 m12 l3">
                <p class="center">
                    <img class="img-rounded" src="${pelicula.imagen}" width="155" height="220">
                </p>
            </div>
            <div class="col col s12 m12 l9">
                <div class="card darken-1">
                    <div class="card-content">
                        <span class="card-title">DETALLES</span>
                        <p>Título Original : ${pelicula.titulo}</p>
                        <p>Actores : ${pelicula.detalle.actores}</p>
                        <p>Director: ${pelicula.detalle.director}</p>
                        <p>Clasificación: ${pelicula.clasificacion}</p>
                        <p>Duración: ${pelicula.duracion} minutos</p>
                        <p>Género: ${pelicula.genero}</p>
                        <p>Fecha Estreno: <fmt:formatDate pattern="dd-MMM-yyyy" value="${pelicula.fechaEstreno}"/></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col col s12 m12 l12">
                <div class="card darken-1">
                    <div class="card-content">
                        <div class="badge-main">
                            <span class="badge green white-text" style="font-size:15px;">${fecha}</span>
                        </div>
                        <table class="striped responsive-table highlight">
                            <thead>
                                <tr>
                                    <th>Hora</th>
                                    <th>Sala</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                            	<c:forEach items="${horarios}" var="horario">                            	
	                                <tr>
	                                    <td>${horario.hora}</td>
	                                    <td>${horario.sala}</td>
	                                    <td>$ ${horario.precio}</td>
	                                </tr> 
                                </c:forEach>                             
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col col s12 m12 l7">
                <div class="card darken-1">
                    <div class="card-content">
                        <span class="card-title">Trailer</span>
                        <iframe width="100%" height="315" src="${ pelicula.detalle.trailer }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    </div>
                </div>
            </div>

            <div class="col col s12 m12 l5">
                <div class="card darken-1">
                    <div class="card-content">
                        <span class="card-title">Sinópsis</span>
                        <p>${pelicula.detalle.sinopsis}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Fin de contenido principal-->


    <jsp:include page="includes/footer.jsp"></jsp:include>

    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
</body>

</html>