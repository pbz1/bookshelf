
<%@ page import="pl.espeo.bookshelf.Hire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hire.label', default: 'Hire')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hire" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hire">
			
				<g:if test="${hireInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="hire.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${hireInstance?.book?.id}">${hireInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hireInstance?.holder}">
				<li class="fieldcontain">
					<span id="holder-label" class="property-label"><g:message code="hire.holder.label" default="Holder" /></span>
					
						<span class="property-value" aria-labelledby="holder-label"><g:link controller="user" action="show" id="${hireInstance?.holder?.id}">${hireInstance?.holder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hireInstance?.hireDate}">
				<li class="fieldcontain">
					<span id="hireDate-label" class="property-label"><g:message code="hire.hireDate.label" default="Hire Date" /></span>
					
						<span class="property-value" aria-labelledby="hireDate-label"><g:formatDate date="${hireInstance?.hireDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hireInstance?.returnDate}">
				<li class="fieldcontain">
					<span id="returnDate-label" class="property-label"><g:message code="hire.returnDate.label" default="Return Date" /></span>
					
						<span class="property-value" aria-labelledby="returnDate-label"><g:formatDate date="${hireInstance?.returnDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hireInstance?.id}" />
					<g:link class="edit" action="edit" id="${hireInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
