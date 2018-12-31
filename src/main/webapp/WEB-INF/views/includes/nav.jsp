<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<spring:url value="/" var="urlRoot"></spring:url>
	
	<sec:authorize access="isAnonymous()">
		<!--Men� de navegaci�n-->
	    <div class="navbar-fixed">    
	        <nav>
	            <div class="nav-wrapper light-blue accent-4">
	                <div class="container">
	                    <a href="${urlRoot}" class="brand-logo"><small>Super Cine</small></a>
	                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	                    <ul class="right hide-on-med-and-down">
	                        <li><a href="${urlRoot}acerca">Acerca de</a></li>
	                        <li><a href="${urlRoot}login-form">Login</a></li>
	                    </ul>
	                </div>
	            </div>
	        </nav>    
	    </div>
	    <ul class="sidenav" id="mobile-demo">
	        <li><a href="${urlRoot}acerca">Acerca de</a></li>
	        <li><a href="${urlRoot}login-form">Login</a></li>
	        <div class="divider"></div>
	        <li><a href="#" class="close-menu"><i class="material-icons">arrow_back</i>Ocultar</a></li>
	    </ul>
	    <!--Fin de men�-->
    </sec:authorize>
    
    
    
    <sec:authorize access="hasAnyAuthority('EDITOR')">
	    <!--Men� de navegaci�n-->
	    <div class="navbar-fixed">    
	        <nav>
	            <div class="nav-wrapper light-blue accent-4">
	                <div class="container">
	                    <a href="${urlRoot}admin/index" class="brand-logo"><small>Super Cine | Administraci�n</small></a>
	                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	                    <ul class="right hide-on-med-and-down">
	                        <li><a href="${urlRoot}peliculas/paginate?page=0">Pel�culas</a></li>
	                        <li><a href="${urlRoot}noticias/paginate?page=0">Noticias</a></li>
	                        <li><a href="${urlRoot}horarios/paginate?page=0">Horarios</a></li>
	                        <li><a href="${urlRoot}admin/logout">Cerrar sesi�n</a></li>            
	                    </ul>
	                </div>
	            </div>
	        </nav>    
	    </div>
	    <ul class="sidenav" id="mobile-demo">
	    	<li><a href="${urlRoot}peliculas/paginate?page=0">Pel�culas</a></li>
            <li><a href="${urlRoot}noticias/paginate?page=0">Noticias</a></li>
            <li><a href="${urlRoot}horarios/paginate?page=0">Horarios</a></li>
            <li><a href="${urlRoot}admin/logout">Cerrar sesi�n</a></li> 
	        <div class="divider"></div>
	        <li><a href="#" class="close-menu"><i class="material-icons">arrow_back</i>Ocultar</a></li>
	    </ul>
	    <!--Fin de men�-->
    </sec:authorize>
    
    
    
    <sec:authorize access="hasAnyAuthority('GERENTE')">
	    <!--Men� de navegaci�n-->
	    <div class="navbar-fixed">    
	        <nav>
	            <div class="nav-wrapper light-blue accent-4">
	                <div class="container">
	                    <a href="${urlRoot}admin/index" class="brand-logo"><small>Super Cine | Administraci�n</small></a>
	                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	                    <ul class="right hide-on-med-and-down">
	                        <li><a href="${urlRoot}peliculas/paginate?page=0">Pel�culas</a></li>
	                        <li><a href="${urlRoot}banners/paginate?page=0">Banners</a></li>
	                        <li><a href="${urlRoot}noticias/paginate?page=0">Noticias</a></li>
	                        <li><a href="${urlRoot}horarios/paginate?page=0">Horarios</a></li>
	                        <li><a href="${urlRoot}usuarios/index?page=0">Usuarios</a></li>
	                        <li><a href="${urlRoot}admin/logout">Cerrar sesi�n</a></li>
	                    </ul>
	                </div>
	            </div>
	        </nav>    
	    </div>
	    <ul class="sidenav" id="mobile-demo">
	    	<li><a href="${urlRoot}peliculas/paginate?page=0">Pel�culas</a></li>
	    	<li><a href="${urlRoot}banners/paginate?page=0">Banners</a></li>
	    	<li><a href="${urlRoot}noticias/paginate?page=0">Noticias</a></li>
	    	<li><a href="${urlRoot}horarios/paginate?page=0">Horarios</a></li>
	    	<li><a href="${urlRoot}usuarios/paginate?page=0">Usuarios</a></li>
	        <li><a href="${urlRoot}admin/logout">Cerrar sesi�n</a></li>
	        <div class="divider"></div>
	        <li><a href="#" class="close-menu"><i class="material-icons">arrow_back</i>Ocultar</a></li>
	    </ul>
	    <!--Fin de men�-->
    </sec:authorize>