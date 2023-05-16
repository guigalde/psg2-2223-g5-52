<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, owners, vets or error"%>

<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<spring:url value="/" htmlEscape="true" />"><span></span></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#main-navbar">
				<span class="sr-only"><os-p>Toggle navigation</os-p></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<c:if test="${currentUserPlan eq 'BASIC'}">
				<span style="font-size: 70px; color: brown; font-style: italic;">${currentUserPlan}</span>
			</c:if>
			<c:if test="${currentUserPlan eq 'ADVANCED'}">
				<span style="font-size: 70px; color: #ADD8E6; font-style: italic;">${currentUserPlan}</span>
			</c:if>
			<c:if test="${currentUserPlan eq 'PRO'}">
				<span style="font-size: 100px; color: #FFBF00; font-style: italic;">${currentUserPlan}</span>
			</c:if>
		</div>
		<div class="navbar-collapse collapse" id="main-navbar">
			<ul class="nav navbar-nav">

				

				<petclinic:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-home" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-home" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-home" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="home"/></span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'owners'}" url="/owners/find"
					title="find owners">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="findOwners"/></span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'vets'}" url="/vets"
					title="veterinarians">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-th-list" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-th-list" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-th-list" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="veterinarians"/></span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'causes'}" url="/cause"
					title="causes">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="causes"/></span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'error'}" url="/oups"
					title="trigger a RuntimeException to see how it is handled">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="errorLabel"/></span>
				</petclinic:menuItem>		
				

				<petclinic:menuItem active="${name eq 'adoptions'}" url="/adoptions/find"
					title="adoptions">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-search" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="adoptions"/></span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'customer-agreement'}" url="/customer-agreement"
					title="customer-agreement">
					<c:if test="${currentUserPlan eq 'BASIC'}">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color: brown;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'ADVANCED'}">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color: #ADD8E6;"></span>
					</c:if>
					<c:if test="${currentUserPlan eq 'PRO'}">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color: #FFBF00;"></span>
					</c:if>
					<span><fmt:message key="customer-agreement"/></span>
				</petclinic:menuItem>

			</ul>




			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="<c:url value="/login" />"><fmt:message key="login"/></a></li>
					<li><a href="<c:url value="/users/new" />"><fmt:message key="register"/></a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">

					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<strong><sec:authentication property="name" /></strong> 
							<span class="glyphicon glyphicon-user icon-size"></span>
							<strong><c:out value="${currentUserPlan.name}"/></strong> 
							<span class="glyphicon glyphicon-chevron-down"></span>

					</a>
						<ul class="dropdown-menu">
							<li>
								<div class="navbar-login">
									<div class="row">
										<div class="col-lg-4">
											<p class="text-center">
												<span class="glyphicon glyphicon-user icon-size"></span>
											</p>
										</div>
										<div class="col-lg-8">
											<p class="text-left">
												<strong><sec:authentication property="name" /></strong>
											</p>
											<p class="text-left">
												<a href="<c:url value="/logout" />"
													class="btn btn-primary btn-block btn-sm"><fmt:message key="logout"/></a>
											</p>
											<p class="text-left">
												<a href="<c:url value="/users/plan" />" 
												class="btn btn-primary btn-block btn-sm">Planes</a>
											</p>
											<p class="text-left">
												<a href="<c:url value="/users/profile" />" 
												class="btn btn-primary btn-block btn-sm">Perfil</a>
											</p>
										</div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
<!-- 							
                            <li> 
								<div class="navbar-login navbar-login-session">
									<div class="row">
										<div class="col-lg-12">
											<p>
												<a href="#" class="btn btn-primary btn-block">My Profile</a>
												<a href="#" class="btn btn-danger btn-block">Change
													Password</a>
											</p>
										</div>
									</div>
								</div>
							</li>
-->
						</ul></li>
				</sec:authorize>
			</ul>
		</div>



	</div>
</nav>
