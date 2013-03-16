
<%@ page import="pl.espeo.bookshelf.Shelf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shelf.label', default: 'Shelf')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shelf" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shelf" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'shelf.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="position" title="${message(code: 'shelf.position.label', default: 'Position')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shelfInstanceList}" status="i" var="shelfInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shelfInstance.id}">${fieldValue(bean: shelfInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: shelfInstance, field: "position")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shelfInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
