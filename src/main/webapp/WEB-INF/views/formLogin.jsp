<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 		       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    
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
	   <div class="col col s12 m12 l6 login">
	   <div class="contenedor container center">
	      <div class="row">
	      	<div class="col col s12 m12 l6">
	       	 	<div class="input-field">
	       	 		<img src="${assets}/images/login.png" title="login" width="260" height="250">
	       	 	</div>
	       	</div>
	      </div>
	      
		  <div class="row">
		    <form class="col col s12 m12 l12" method="post" action="${root}login">
		       
		       <div class="row"> 	
		       	<c:if test="${param.error!= null}">
					<img src="${assets}/images/error.png" width="48" height="48" class="center">
					<h5 style="color:red">Acceso denegado</h5>
				</c:if>
		       </div>
		       
		       <div class="row">
			        <div class="input-field">
			          <input id="username" name="username" type="text" class="validate" required="required" />
			          <label for="username">Usuario</label>
			        </div>
		       </div>
		       <div class="row">
			        <div class="input-field">
			          <input id="password" name="password" type="password" class="validate" required="required" />
			          <label for="password">Contraseña</label>
			        </div>
		       </div>
		       
		       <input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}"/>
		       
		       <div class="row">
		        	<button class="btn waves-effect blue darken-3" type="submit" name="action">Entrar
		                <i class="material-icons right">account_circle</i>
		            </button>
		        </div>
		    </form>
		    </div>
		  </div>  
       </div>
    </div>
    <!--Fin de contenido principal-->

	<br>
    <jsp:include page="includes/footer.jsp"></jsp:include>


    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
</body>

</html>