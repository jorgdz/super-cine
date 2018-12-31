<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    		<%-- Para hacer uso de Expression Language como el <c:forEach>--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>         <%-- Para dar formato como por ejemplo la Fecha --%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>	<%-- Para hacer uso de los tags de Spring como por ejemplo <spring:url /> para los assets --%>
<!DOCTYPE html>
<html lang="es">
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>SuperCine</title>
	
	<spring:url value="/resources" var="assets" />
	<spring:url value="/" var="root" />
	
	<link href="${assets}/css/materialize.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="${assets}/css/style.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="includes/nav.jsp"></jsp:include>

    <br>
    <!--Contenido principal-->
    <div class="container">
        <div class="row">
            <div class="carousel carousel-slider">
            	
            	<c:forEach items="${banners}" var ="banner">
            		<a class="carousel-item" href="#"><img src="${banner.archivo}" height="280" alt="${banner.titulo}" title="${banner.titulo}"></a>
            	</c:forEach>
            
            </div>
        </div>
        <br>
       <div class="row">
           <div class="col col s12 center">
               	<div class="badge-main">
                    <span class="badge green">CARTELERA</span>
                </div>
            </div>
       </div>
        
       <div class="row">
       		<%--Buscar por fechas--%>
	       	<form action="${root}search" method="POST">
	       		<div class="col col s12 m6 l3">
	                <div class="input-field">
	                    <select id="fecha" name="fecha">
	                       	<c:forEach items="${fechas}" var="fecha">
	                       		<c:choose>
	                 				<c:when test="${fecha == fechaBusqueda}">
	                 					<option selected value="${ fecha }">${ fecha }</option>
	                 				</c:when>
	                 				<c:otherwise>
	                 					<option value="${ fecha }">${ fecha }</option>	
	                 				</c:otherwise>
	                       		</c:choose>
	                       	</c:forEach>
	                    </select>
	                    <label>Seleccione la fecha</label>
	                </div>              
	            </div>
	            <div class="col col s12 m6 l3">
	                <div class="input-field">
	                	
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                    
	                    <button class="btn waves-effect waves-light light-blue accent-4" type="submit">Buscar
	                        <i class="material-icons right">search</i>
	                    </button>
	                </div>   
	            </div>
	       	</form> 
	       	
        </div>
        <div class="divider"></div>
        
        <!--Películas-->
        <div class="row">
        	<c:forEach items="${peliculas}" var="pelicula">
        		<div class="col col s12 m8 l4">                          
	                <div class="card">
	                    <div class="card-image">
	                        <img src="${pelicula.imagen}" height="450">
	                       <a class="btn-floating halfway-fab waves-effect waves-light light-blue accent-4" href="detail/${pelicula.id}/${fechaBusqueda}"><i class="material-icons">keyboard_arrow_right</i></a>
	                       <%--<a class="btn-floating halfway-fab waves-effect waves-light light-blue accent-4" href="detail?id=${pelicula.id}&fecha=${fechaBusqueda}"><i class="material-icons">keyboard_arrow_right</i></a>--%>
	                    </div>
	                    <div class="card-content">
	                        <span class="card-title" style="font-size:16px;">${pelicula.titulo}</span>
	                    </div>
	                    <div class="card-action green lighten-5">
	                        <p style="color:deepskyblue">${pelicula.clasificacion}</p>
	                        <p style="color:deepskyblue">${pelicula.duracion} min.</p>
	                        <p style="color:deepskyblue">${pelicula.genero}</p>
	                    </div>
	                </div>              
            	</div>
        	</c:forEach>                
        </div>

        <!--Noticias-->
        <div class="row">
            <div class="col col s12 center">
                <div class="badge-main">
                    <span class="badge green">Noticias y Novedades</span>
                </div>
            </div>
        </div>
        <div class="divider"></div>

        <div class="row">
            <div class="col col s12">
                <c:forEach items="${noticias}" var="noticia">
                	<div>
	                    <h5>${noticia.titulo}</h5>
	            
	                    <p class="badge-publish"><span class="badge red lighten-1">Publicado: <fmt:formatDate pattern="dd-MMM-yyyy" value="${noticia.fecha}" /></span></p>
	                    <p>${noticia.detalle}</p>
	                    
	                </div>             
	                <div class="divider"></div>
                </c:forEach>	        

            </div>
        </div>
       
    </div>
    <!--Fin de contenido principal-->

   <jsp:include page="includes/footer.jsp"></jsp:include>
	
	<script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/carousel.js"></script>
    <script src="${assets}/js/main.js"></script>
    	
</body>
</html>