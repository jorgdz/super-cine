<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  	       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Usuarios</title>
    
    <spring:url value="/resources" var="assets" />
	<spring:url value="/usuarios" var="root" />
	
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
            <div class="col s12 m12 l12">
                <h4>Lista de Usuarios</h4>
                   
                  <%--Mensaje de usuario creada --%>
                  <c:if test="${success != null}">               	       
		              <div class="card teal green lighten-3">
					        <div class="card-content white-text">
					          	<span class="card-title"><strong>Ok!</strong></span>
								<p>${success}</p>	         	
					        </div>
				      </div>
                  </c:if>
	              
			    
                <a href="${root}/create" class="btn-floating btn-large waves-effect waves-light light-blue accent-4"><i class="material-icons">add</i></a>                                          
                <table class="responsive-table striped highlight">
                    <thead>
                        <tr>                          
                            <th>Cuenta</th>
                            <th>Correo</th>
                            <th>Teléfono</th>
                            <th>Habilitado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>               
                    <tbody>
                       
                        <c:forEach items="${usuarios.content}" var="usuario">  
                        	<tr>         	             
	                            <td>${usuario.cuenta}</td>
	                            <td>${usuario.email}</td>
	                            <td>${usuario.telefono}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${usuario.activo == 'true'}">
	                            			<div class="badge-publish">
	                            				<span class="badge green">SI</span>
	                            			</div>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<div class="badge-publish">
	                            				<span class="badge red">NO</span>
	                            			</div>
	                            		</c:otherwise>
	                            	</c:choose>
	                            	
	                            </td>	                            
	                            <td>
	                                <%--<a href="${root}/edit/${usuario.id}" class="btn-floating btn-small waves-effect waves-light green"><i class="material-icons">edit</i></a>--%>
	                                <a href="${root}/destroy/${usuario.id}" onclick="return confirm('Estás seguro')" class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">delete</i></a>
	                            </td>
                           	</tr>                         
                        </c:forEach>
                                  
                    </tbody>
                </table>
                  <ul class="pagination">
				    <li class="waves-effect"><a href="${root}/index?page=${usuarios.number - 1}"><i class="material-icons">chevron_left</i></a></li>
				    <li class="waves-effect"><a href="#!">...</a></li>
				    <li class="waves-effect"><a href="${root}/index?page=${usuarios.number + 1}"><i class="material-icons">chevron_right</i></a></li>
				  </ul>
            </div>
        </div>
    </div>
    <!--Fin de contenido principal-->

	<jsp:include page="../includes/footer.jsp"></jsp:include>

    <script src="${assets}/js/jquery.min.js"></script>
    <script src="${assets}/js/materialize.min.js"></script>
    <script src="${assets}/js/main.js"></script>
    <script src="${assets}/js/sweetalert2.all.min.js"></script>
    <script src="${assets}/js/confirm.js"></script>
</body>

</html>