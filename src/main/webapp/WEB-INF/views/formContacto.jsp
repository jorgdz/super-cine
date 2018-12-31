<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 		       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Formulario de Contacto</title>
    
    <spring:url value="/resources" var="assets" />
    <spring:url value="/" var="root" />
   
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
            <div class="col col s12 center">
               	<div class="badge-main">
                    <span class="badge green">CONTACTO</span>
                </div>
            </div>
        </div>
     
        ${contacto}
        <form:form action="${root}contacto" method="post" modelAttribute="contacto">      
	        <div class="row">
	        	<div class="col col s12 m12 l12">
		        	<div class="input-field">
		          		<form:input id="nombre" path="nombre" type="text" class="validate" />
		          		<label for="nombre">Nombre</label>
		        	</div>
	        	</div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l12">
		        	<div class="input-field">
		          		<form:input id="email" path="email" type="email" class="validate" />
		          		<label for="email">Email</label>
		        	</div>
	        	</div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l12">
		        	<label>Géneros Favoritos</label>
		        	<div class="input-field">
		        		 <form:select path="generos" multiple="multiple" items="${ generos }" />
		        	</div>
		        </div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l12">
	        		<label>Tu experiencia en el sitio</label> 	        		  
		        	<div class="input-field">
		        		<p>
			        		<label>
						      <form:radiobutton class="with-gap" value="1" path="rating" />
						      <span>Muy Mala</span>
						    </label>
					    </p>
					    <p>
						    <label>
						      <form:radiobutton class="with-gap" value="2" path="rating" />
						      <span>Mala</span>
						    </label>
					    </p>
					    <p>
						    <label>
						      <form:radiobutton class="with-gap" value="3" path="rating" />
						      <span>Regular</span>
						    </label>
					    </p>
					    <p>
						    <label>
						      <form:radiobutton class="with-gap" value="4" path="rating" />
						      <span>Buena</span>
						    </label>
					    </p>
					    <p>
						    <label>
						      <form:radiobutton class="with-gap" value="5" path="rating" />
						      <span>Muy Buena</span>
						    </label>
					    </p>
		        	</div>
		        </div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l12">
	        		<label>Te gustaría recibir notificaciones de:</label>	        		  
		        	<div class="input-field">        			   
        		 		<form:select path="notificaciones" multiple="multiple" items="${ tipos }" />    		 			
		        	</div>
		        </div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l12">
	            	 <div class="input-field">
	            	 	<form:textarea id="comentarios" path="comentarios" class="materialize-textarea" required="required" />
	                    <label for="comentarios">Comentarios</label>
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


    <jsp:include page="includes/footer.jsp"></jsp:include>


    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
</body>

</html>