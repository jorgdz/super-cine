<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   	
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 		
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Banner</title>
    
    <spring:url value="/resources" var="assets" />
	<spring:url value="/banners" var="root" />
	
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
                <span class="badge green darken-3 white-text" style="font-size:22px;">Datos del Banner</span>
            </div>
        </div> 
        
        
        
        <%--Errores --%>
        <spring:hasBindErrors name="banner">
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
        
        
        
        <form:form action="${root}/save" method="post" enctype="multipart/form-data" modelAttribute="banner">	
	        <div class="row">
	        	 <div class="col col s12 m12 l6">
	        	 	<div class="input-field">
	        	 		<img src="${banner.archivo}" title="Imagen preliminar" width="450" height="80">
	        	 	</div>
	        	 </div>
	        </div>
	        
	        <div class="row">
	            <div class="col col s12 m12 l6">
	                <div class="input-field">
	                  	<form:hidden path="id" />
	                    <form:input type="text" id="titulo" path="titulo" class="validate" required="required" />
	                    <label for="titulo">Título</label>
	                </div>
	            </div>
	            <div class="col col s12 m12 l6">
	            	<div class="input-field">
	            		<form:select path="estado">
	                        <form:option value="Activo">Activo</form:option>
	                        <form:option value="Inactivo">Inactivo</form:option>
	                    </form:select>
	                    <label>Estado</label>
	            	</div>
	            </div>
	       	</div>
	       	
	     	<div class="row">
     			<div class="col col s12 m12 l6">
	                <div class="file-field input-field">
					      <div class="btn light-blue accent-4">
						        <span>Banner</span>
						        <form:hidden path="archivo"/>
						        <form:hidden path="name_file"/>
						        <c:choose>
						        	<c:when test="${banner.id == '0'}">
						        		<input type="file" name="bannerImagen" required="required">	
						        	</c:when>
						        	<c:otherwise>
						        		<input type="file" name="bannerImagen">
						        	</c:otherwise>
						        </c:choose>					   
					      </div>
					      <div class="file-path-wrapper">
				        		<input class="file-path validate" type="text">
					      </div>
				    </div>  
	            </div>         
	     	</div> 	     	
	            
	        <div class="row">
	            <button class="btn waves-effect green darken-3" type="submit" name="action">Guardar Banner
	                <i class="material-icons right">send</i>
	            </button>
	        </div>
        </form:form>
        
    </div>
    <!--Fin de contenido principal-->
	<br><br><br><br>
	<br><br><br><br>
	<br><br>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>

    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
</body>

</html>