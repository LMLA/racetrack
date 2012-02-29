
<%@ page import="racetrack.Race" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-race" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list race">
			
				<g:if test="${raceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="race.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${raceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="race.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${raceInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="race.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${raceInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="race.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${raceInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.distance}">
				<li class="fieldcontain">
					<span id="distance-label" class="property-label"><g:message code="race.distance.label" default="Distance" /></span>
					
						<span class="property-value" aria-labelledby="distance-label"><g:fieldValue bean="${raceInstance}" field="distance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="race.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${raceInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.maxRunners}">
				<li class="fieldcontain">
					<span id="maxRunners-label" class="property-label"><g:message code="race.maxRunners.label" default="Max Runners" /></span>
					
						<span class="property-value" aria-labelledby="maxRunners-label"><g:fieldValue bean="${raceInstance}" field="maxRunners"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${raceInstance?.registrations}">
				<li class="fieldcontain">
					<span id="registrations-label" class="property-label"><g:message code="race.registrations.label" default="Registrations" /></span>
					
						<g:each in="${raceInstance.registrations}" var="r">
						<span class="property-value" aria-labelledby="registrations-label"><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${raceInstance?.id}" />
					<g:link class="edit" action="edit" id="${raceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
