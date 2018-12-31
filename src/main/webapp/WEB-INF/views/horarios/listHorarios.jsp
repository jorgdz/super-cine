<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    	
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  	       
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Horarios</title>
    
    <spring:url value="/resources" var="assets" />
	<spring:url value="/horarios" var="root" />
	
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
                <h4>Lista de Horarios</h4>
                   
                  <%--Mensaje de horario creada --%>
                  <c:if test="${success != null}">               	       
		              <div class="card teal green lighten-3">
					        <div class="card-content white-text">
					          	<span class="card-title"><strong>Ok!</strong></span>
								<p>${success}</p>	         	
					        </div>
				      </div>
                  </c:if>
	              
			    
                <a href="${root}/create" class="btn-floating btn-large waves-effect waves-light light-blue accent-4"><i class="material-icons">add</i></a>
                
              <%--<div>
                	<form action="#" method="POST">
                		<div class="col col s12 m12 l5">		        	
			        		<label>Película</label>
				        	<div class="input-field">			
				          		<select name="titulo">
				          			<option value=""></option>
				          			<c:forEach items="${peliculas}" var="pelicula">
				          				<option value="${ pelicula.titulo }">${ pelicula.titulo }</option>	
				          			</c:forEach>
				          		</select>
				        	</div>
	        			</div>
                		<div class="col col s12 m12 l4">		        	
			        		<label>Seleccione</label>
			        		<div class="input-field">
			        			 <input type="text" name="fecha" id="fecha" class="datepicker" />
			            		 <label for="fecha">Fecha</label>
			        		</div>
	        			</div>
	        			<div class="col col s12 m12 l3">
			        		<label>Hora</label>
			        		<div class="input-field">
			        			  <input type="text" name="hora" class="timepicker" />
			        		</div>
			        	</div>
	        			<div class="col col s12 m12 l3">		    
			        		<div class="input-field">
			        			<label>Sala</label>
			        			<select name="sala">
			        				<option value=""></option>
			        				<c:forEach items="${salas}" var="sala">
			        					<option value="${ sala }">${ sala }</option>	
			        				</c:forEach>
			        			</select>
			        		</div>
			        	</div>
	        			<div class="col col s12 m12 l3">
				        	<div class="input-field">
				          		<input id="precio" name="precio" type="text" class="validate" />
				          		<label for="precio">Precio</label>
				        	</div>
			        	</div>
                		<div class="col col s12 m6 l3">
			                <div class="input-field">
			                	
			                	<input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}"/>
			                	
			                    <button class="btn waves-effect waves-light light-blue accent-4" type="submit">Buscar
			                        <i class="material-icons right">search</i>
			                    </button>
			                </div>   
			            </div>
                	</form>
                </div>--%>
                
                <table class="responsive-table striped highlight">
                    <thead>
                        <tr>                          
                            <th>Película</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Precio</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>               
                    <tbody>
                       
                        <c:forEach items="${horarios.content}" var="horario">  
                        	<tr>         	             
	                            <td>${horario.pelicula.titulo}</td>
	                            <td><fmt:formatDate value="${horario.fecha}" pattern="dd-MM-yyyy"/></td>
	                            <td>${horario.hora}</td>
	                            <td>${horario.sala}</td>
	                            <td>${horario.precio}</td>	                            
	                            <td>
	                                <a href="${root}/edit/${horario.id}" class="btn-floating btn-small waves-effect waves-light green"><i class="material-icons">edit</i></a>
	                                <a href="${root}/destroy/${horario.id}" onclick="return confirm('Estás seguro')" class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">delete</i></a>
	                            </td>
                           	</tr>                         
                        </c:forEach>
                                  
                    </tbody>
                </table>
                  <ul class="pagination">
				    <li class="waves-effect"><a href="${root}/paginate?page=${horarios.number - 1}"><i class="material-icons">chevron_left</i></a></li>
				    <li class="waves-effect"><a href="#!">...</a></li>
				    <li class="waves-effect"><a href="${root}/paginate?page=${horarios.number + 1}"><i class="material-icons">chevron_right</i></a></li>
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
    <script src="${assets}/js/datePicker.js"></script>
</body>

</html>