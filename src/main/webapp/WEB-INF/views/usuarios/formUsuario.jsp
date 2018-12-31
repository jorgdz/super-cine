<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 		       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Usuario</title>
    
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
                <span class="badge green darken-3 white-text" style="font-size:22px;">Datos del usuario</span>
            </div>
        </div> 
     	
     	<%--Errores --%>
        <spring:hasBindErrors name="usuario">
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
        
        <form:form action="${root}usuarios/save" method="post" modelAttribute="usuario">      
	        <div class="row">
	        	<div class="col col s12 m12 l6">
	        		<form:hidden path="id" />
	        		<label>Perfil</label>
		        	<div class="input-field">
		          		<select id="perfil" name="perfil">
		          			<option value="EDITOR">EDITOR</option>
		          			<option value="GERENTE">GERENTE</option>
		          		</select>
		        	</div>
	        	</div>
	        	<div class="col col s12 m12 l6">       
	        		<label>Cuenta</label> 		
	        		<div class="input-field">
	        			 <form:input type="text" path="cuenta" id="cuenta" class="validate" required="required" />
	            	</div>
	        	</div>
	        </div>
	        
	        <div class="row">
	        	<div class="col col s12 m12 l6">
	        		<div class="input-field">
	        			<form:input type="password" path="pwd" id="pwd" class="validate" required="required" />
	        			<label for="pwd">Contraseña</label>
	        		</div>
	        	</div>
	        	
	        	<div class="col col s12 m12 l6">        		
	        		<div class="input-field">
	        			<form:input type="email" path="email" id="email" class="validate" required="required" />
	        			<label for="email">Email</label>
	        		</div>
	        	</div>
	        </div>
	        
	    	<div class="row">
	        	<div class="col col s12 m12 l6">
		        	<div class="input-field">
		          		<form:input id="telefono" path="telefono" type="text" class="validate" required="required" />
		          		<label for="telefono">Teléfono</label>
		        	</div>
	        	</div>
	        </div>	       	    
	        
	        <div class="row">
	        	<button class="btn waves-effect green darken-3" type="submit">Enviar
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
</body>

</html>