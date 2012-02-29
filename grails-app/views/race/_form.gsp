<%@ page import="racetrack.Race" %>



<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="race.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${raceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="race.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${raceInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="race.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${raceInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="race.state.label" default="State" />
		
	</label>
	<g:select name="state" from="${raceInstance.constraints.state.inList}" value="${raceInstance?.state}" valueMessagePrefix="race.state" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="race.distance.label" default="Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="distance" min="0.0" required="" value="${fieldValue(bean: raceInstance, field: 'distance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="race.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cost" min="0.0" max="100.0" required="" value="${fieldValue(bean: raceInstance, field: 'cost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'maxRunners', 'error')} required">
	<label for="maxRunners">
		<g:message code="race.maxRunners.label" default="Max Runners" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="maxRunners" min="0" max="10000" required="" value="${fieldValue(bean: raceInstance, field: 'maxRunners')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'registrations', 'error')} ">
	<label for="registrations">
		<g:message code="race.registrations.label" default="Registrations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${raceInstance?.registrations?}" var="r">
    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="registration" action="create" params="['race.id': raceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registration.label', default: 'Registration')])}</g:link>
</li>
</ul>

</div>

