
<%@ page import="racetrack.Registration" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="registration.race.label" default="Race" /></th>
					
						<th><g:message code="registration.runner.label" default="Runner" /></th>
					
						<g:sortableColumn property="paid" title="${message(code: 'registration.paid.label', default: 'Paid')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'registration.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registrationInstance.id}">${fieldValue(bean: registrationInstance, field: "race")}</g:link></td>
					
						<td>${fieldValue(bean: registrationInstance, field: "runner")}</td>
					
						<td><g:formatBoolean boolean="${registrationInstance.paid}" /></td>
					
						<td><g:formatDate date="${registrationInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registrationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
