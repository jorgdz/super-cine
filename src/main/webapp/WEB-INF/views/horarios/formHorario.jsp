<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 		       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Horario</title>
    
    <spring:url value="/resources" var="assets" />
    <spring:url value="/" var="root" />
   
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
                <span class="badge green darken-3 white-text" style="font-size:22px;">Agregar horario</span>
            </div>
        </div> 
     	
     	 <%--Errores --%>
        <spring:hasBindErrors name="horario">
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
        
        <form:form action="${root}horarios/save" method="post" modelAttribute="horario">      
	        <div class="row">
	        	<div class="col col s12 m12 l6">
	        		<form:hidden path="id" />
	        		<label>Película</label>
		        	<div class="input-field">
		          		<form:select path="pelicula.id" items="${ peliculas }" itemLabel="titulo" itemValue="id" />
		        	</div>
	        	</div>
	        	<div class="col col s12 m12 l6">
	        		<label>Seleccione</label>
	        		<div class="input-field">
	        			 <form:input type="text" path="fecha" id="fecha" class="datepicker" required="required" />
	            		 <label for="fecha">Fecha</label>
	        		</div>
	        	</div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l6">
	        		<label>Hora</label>
	        		<div class="input-field">
	        			  <form:input type="text" path="hora" class="timepicker" />
	        		</div>
	        	</div>
	        	
	        	<div class="col col s12 m12 l6">
	        		<label>Sala</label>
	        		<div class="input-field">
	        			<form:select path="sala" items="${salas}"></form:select>
	        		</div>
	        	</div>
	        </div>
	        
	    	<div class="row">
	        	<div class="col col s12 m12 l6">
		        	<div class="input-field">
		          		<form:input id="precio" path="precio" type="text" class="validate" />
		          		<label for="precio">Precio</label>
		        	</div>
	        	</div>
	        </div>	       	    
	        
	        <div class="row">
	        	<button class="btn waves-effect green darken-3" type="submit" name="action">Enviar
	                <i class="material-icons right">send</i>
	            </button>
	        </div>
	        
        </form:form>
    </div>
    <!--Fin de contenido principal-->

	<br><br><br><br>
	
    <jsp:include page="../includes/footer.jsp"></jsp:include>


    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
    <script src="${assets}/js/datePicker.js"></script>
</body>

</html>