<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  	       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Noticia</title>
    
    <spring:url value="/resources" var="assets" />
	<spring:url value="/noticias" var="root" />
	
    <link rel="stylesheet" href="${assets}/css/materialize.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${assets}/css/style.css">
</head>

<body>
   	<jsp:include page="../includes/nav.jsp"></jsp:include>

    <br>
    <!--Contenido principal-->
    <div class="container">
        <div class="row">
            <div class="badge-main">
                <span class="badge green darken-3 white-text" style="font-size:22px;">Datos de la noticia</span>
            </div>
        </div> 
        
        <spring:hasBindErrors name="noticia">
        
      		<div class="col s12 m8 l12">
		      <div class="card red accent-1">
		        <div class="card-content white-text">
		          <span class="card-title"><strong>Error(es)</strong></span>
					
					<c:forEach items="${errors.allErrors}" var="error">
						<p>
							<spring:message message="${error}"></spring:message>
						</p>
						<br>
					</c:forEach>
						         	
		        </div>
		      </div>
		    </div>
      
        </spring:hasBindErrors>
        
        <form:form action="${root}/save" method="post" modelAttribute="noticia">	
	        <div class="row">
	            <div class="col col s12 m12 l8">
	                <div class="input-field">
	                	<form:hidden path="id"/>
	                    <form:input type="text" id="titulo" path="titulo" required="required" class="validate" />
	                    <label for="titulo">Título</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l4">
	                <div class="input-field">
	                    <form:select path="estado">
	                        <form:option value="Activa">Activa</form:option>
	                        <form:option value="Inactiva">Inactiva</form:option>
	                    </form:select>
	                    <label>Estado</label>
	                </div>
	            </div>
	        </div>   
	        <div class="row">
	            <div class="col col s12 m12 l12">
	                <label for="detalle">Detalles</label>
	                <div class="input-field">
	                    <form:textarea class="form-control" path="detalle" id="detalle" rows="14"></form:textarea>
	                </div>
	            </div>
	        </div>     
	        <div class="row">
	            <button class="btn waves-effect green darken-3" type="submit" name="action">Guardar
	                <i class="material-icons right">send</i>
	            </button>
	        </div>
        </form:form>
    </div>
    <!--Fin de contenido principal-->

	<jsp:include page="../includes/footer.jsp"></jsp:include>

    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
    <script src="${assets}/tinymce/tinymce.min.js"></script>
    <script src="${assets}/js/editor.js"></script>
</body>

</html>