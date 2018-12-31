<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  	       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Película</title>
    
    <spring:url value="/resources" var="assets" />
	<spring:url value="/peliculas" var="root" />
	
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
                <span class="badge green darken-3 white-text" style="font-size:22px;">Datos de la película</span>
            </div>
        </div> 
        
        
        
        <%--Errores --%>
        <spring:hasBindErrors name="pelicula">
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
        <%--Fin Errores --%>
        
        
        
        <form:form action="${root}/save" method="post" enctype="multipart/form-data" modelAttribute="pelicula">	
	        <div class="row">
	        	<div class="col col s12 m12 l6">
	                <div class="input-field">
	                	<img src="${pelicula.imagen}" title="Imagen actual de la película" width="150" height="200">
	                </div>
	            </div>
	        </div>
	        
	        <div class="row">
	            <div class="col col s12 m12 l6">
	                <div class="input-field">
	                	<form:hidden path="id" />
	                	<form:hidden path="detalle.id" />
	                    <form:input id="titulo" type="text" path="titulo" class="validate" required="required" />
	                    <label for="titulo">Título</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l6">
	                <div class="input-field">
	                    <form:input id="duracion" type="text" path="duracion" class="validate" required="required" />
	                    <label for="duracion">Duración</label>
	                </div>
	            </div>
	       	</div>
	       	
	     	<div class="row">
	            <div class="col col s12 m12 l6">
	                <div class="input-field">
	                    <form:select path="clasificacion">
	                        <form:option value="A">Clasificación A</form:option>
	                        <form:option value="B">Clasificación B</form:option>
	                    	<form:option value="C">Clasificación C</form:option>
	                    </form:select>
	                    <label>Clasificación</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l6">
	            	<div class="input-field">
	            		<form:select path="genero" items="${generos}"></form:select>
	                    
	                    <%--<form:select path="genero">                       	 
	                       	<form:option value="Accion">Accion</form:option>
			                <form:option value="Aventura">Aventura </form:option>
			                <form:option value="Clasicas">Clasicas</form:option>                  
			                <form:option value="Comedia Romantica">Comedia Romantica</form:option>                  
			                <form:option value="Drama">Drama</form:option>                  
			                <form:option value="Terror">Terror</form:option>                  
			                <form:option value="Infantil">Infantil</form:option>                  
			                <form:option value="Accion y Aventura">Accion y Aventura</form:option>                  
			                <form:option value="Romantica">Romantica</form:option>		                   		                 
	                    </form:select>--%>
	                    <label>Género</label>
	                </div>
	            </div>
	     	</div>  
	     	
	     	<div class="row">
	     		<div class="col col s12 m12 l6">
	            	<div class="input-field">
	            		<form:select path="estado">
	                        <form:option value="Activa">Activa</form:option>
	                        <form:option value="Inactiva">Inactiva</form:option>
	                    </form:select>
	                    <label>Estado</label>
	            	</div>
	            </div>
	            <div class="col col s12 m12 l6">
	            	<div class="input-field">
	            		 <form:input type="text" path="fechaEstreno" id="fechaEstreno" class="datepicker" required="required" />
	            		 <label for="fechaEstreno">Fecha de estreno</label>
	            	</div>
	            </div>
	     	</div> 
	     	
	     	<div class="row">
	     		<div class="col col s12 m12 l6">            	
            		<div class="file-field input-field">
					      <div class="btn light-blue accent-4">
						        <span>Imagen de película</span>
						        <form:hidden path="imagen"/>
						        <form:hidden path="name_image"/>					        
						        <input type="file" name="archivoImagen" />					        						        							        							        					        	
					      </div>
					      <div class="file-path-wrapper">
				        		<input class="file-path validate" type="text">
					      </div>
				    </div>   	
	            </div>
	     	</div>
	     	
	     	<div class="row">
	     		<div class="badge-main">
	                <span class="badge green darken-3 white-text" style="font-size:22px;">Detalles</span>
	            </div>
	     	</div>
	         
	        <div class="divider"></div>
	            
	        <div class="row">
	        	<div class="col col s12 m12 l4">
	                <div class="input-field">
	                    <form:input id="director" type="text" path="detalle.director" class="validate" required="required" />
	                    <label for="director">Director</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l4">
	                <div class="input-field">
	                    <form:input id="actores" type="text" path="detalle.actores" class="validate" required="required" />
	                    <label for="actores">Actores</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l4">
	            	 <div class="input-field">
	            	 	<form:input id="trailer" type="text" path="detalle.trailer" class="validate" required="required" />
	                    <label for="trailer">URL del Trailer</label>
	            	 </div>
	            </div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l4">
	            	 <div class="input-field">
	            	 	<form:textarea id="sinopsis" path="detalle.sinopsis" class="materialize-textarea" required="required" />
	                    <label for="sinopsis">Sinopsis</label>
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
    <script src="${assets}/js/datePicker.js"></script>
</body>

</html>