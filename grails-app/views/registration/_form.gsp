<%@ page import="racetrack.Registration" %>



<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'race', 'error')} required">
	<label for="race">
		<g:message code="registration.race.label" default="Race" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="race" name="race.id" from="${racetrack.Race.list()}" optionKey="id" required="" value="${registrationInstance?.race?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'runner', 'error')} required">
	<label for="runner">
		<g:message code="registration.runner.label" default="Runner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="runner" name="runner.id" from="${racetrack.Runner.list()}" optionKey="id" required="" value="${registrationInstance?.runner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'paid', 'error')} ">
	<label for="paid">
		<g:message code="registration.paid.label" default="Paid" />
		
	</label>
	<g:checkBox name="paid" value="${registrationInstance?.paid}" />
</div>

