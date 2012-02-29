
<%@ page import="racetrack.Runner" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-runner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-runner" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'runner.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'runner.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="dateOfBirth" title="${message(code: 'runner.dateOfBirth.label', default: 'Date Of Birth')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'runner.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'runner.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'runner.city.label', default: 'City')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${runnerInstanceList}" status="i" var="runnerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${runnerInstance.id}">${fieldValue(bean: runnerInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: runnerInstance, field: "lastName")}</td>
					
						<td><g:formatDate date="${runnerInstance.dateOfBirth}" /></td>
					
						<td>${fieldValue(bean: runnerInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: runnerInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: runnerInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${runnerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
