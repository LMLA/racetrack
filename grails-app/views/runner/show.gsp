
<%@ page import="racetrack.Runner" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-runner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-runner" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list runner">
			
				<g:if test="${runnerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="runner.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${runnerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="runner.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${runnerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="runner.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${runnerInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="runner.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${runnerInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="runner.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${runnerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="runner.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${runnerInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="runner.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${runnerInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.zipcode}">
				<li class="fieldcontain">
					<span id="zipcode-label" class="property-label"><g:message code="runner.zipcode.label" default="Zipcode" /></span>
					
						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${runnerInstance}" field="zipcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="runner.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${runnerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${runnerInstance?.registrations}">
				<li class="fieldcontain">
					<span id="registrations-label" class="property-label"><g:message code="runner.registrations.label" default="Registrations" /></span>
					
						<g:each in="${runnerInstance.registrations}" var="r">
						<span class="property-value" aria-labelledby="registrations-label"><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${runnerInstance?.id}" />
					<g:link class="edit" action="edit" id="${runnerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
