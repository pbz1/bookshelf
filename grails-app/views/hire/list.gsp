
<%@ page import="pl.espeo.bookshelf.Hire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hire.label', default: 'Hire')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hire" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="hire.book.label" default="Book" /></th>
					
						<th><g:message code="hire.holder.label" default="Holder" /></th>
					
						<g:sortableColumn property="hireDate" title="${message(code: 'hire.hireDate.label', default: 'Hire Date')}" />
					
						<g:sortableColumn property="returnDate" title="${message(code: 'hire.returnDate.label', default: 'Return Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hireInstanceList}" status="i" var="hireInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hireInstance.id}">${fieldValue(bean: hireInstance, field: "book")}</g:link></td>
					
						<td>${fieldValue(bean: hireInstance, field: "holder")}</td>
					
						<td><g:formatDate date="${hireInstance.hireDate}" /></td>
					
						<td><g:formatDate date="${hireInstance.returnDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hireInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
