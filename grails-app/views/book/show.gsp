
<%@ page import="pl.espeo.bookshelf.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-book" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="book.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${bookInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.oryginalTitle}">
				<li class="fieldcontain">
					<span id="oryginalTitle-label" class="property-label"><g:message code="book.oryginalTitle.label" default="Oryginal Title" /></span>
					
						<span class="property-value" aria-labelledby="oryginalTitle-label"><g:fieldValue bean="${bookInstance}" field="oryginalTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="author" action="show" id="${bookInstance?.author?.id}">${bookInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.translator}">
				<li class="fieldcontain">
					<span id="translator-label" class="property-label"><g:message code="book.translator.label" default="Translator" /></span>
					
						<span class="property-value" aria-labelledby="translator-label"><g:link controller="author" action="show" id="${bookInstance?.translator?.id}">${bookInstance?.translator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publisher}">
				<li class="fieldcontain">
					<span id="publisher-label" class="property-label"><g:message code="book.publisher.label" default="Publisher" /></span>
					
						<span class="property-value" aria-labelledby="publisher-label"><g:link controller="publisher" action="show" id="${bookInstance?.publisher?.id}">${bookInstance?.publisher?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publishedDate}">
				<li class="fieldcontain">
					<span id="publishedDate-label" class="property-label"><g:message code="book.publishedDate.label" default="Published Date" /></span>
					
						<span class="property-value" aria-labelledby="publishedDate-label"><g:formatDate date="${bookInstance?.publishedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.holder}">
				<li class="fieldcontain">
					<span id="holder-label" class="property-label"><g:message code="book.holder.label" default="Holder" /></span>
					
						<span class="property-value" aria-labelledby="holder-label"><g:link controller="user" action="show" id="${bookInstance?.holder?.id}">${bookInstance?.holder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.introUrl}">
				<li class="fieldcontain">
					<span id="introUrl-label" class="property-label"><g:message code="book.introUrl.label" default="Intro Url" /></span>
					
						<span class="property-value" aria-labelledby="introUrl-label"><g:fieldValue bean="${bookInstance}" field="introUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="book.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${bookInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.pages}">
				<li class="fieldcontain">
					<span id="pages-label" class="property-label"><g:message code="book.pages.label" default="Pages" /></span>
					
						<span class="property-value" aria-labelledby="pages-label"><g:fieldValue bean="${bookInstance}" field="pages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="book.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${bookInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="book.categories.label" default="Categories" /></span>
					
						<g:each in="${bookInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.shelf}">
				<li class="fieldcontain">
					<span id="shelf-label" class="property-label"><g:message code="book.shelf.label" default="Shelf" /></span>
					
						<span class="property-value" aria-labelledby="shelf-label"><g:link controller="shelf" action="show" id="${bookInstance?.shelf?.id}">${bookInstance?.shelf?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="book.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${bookInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bookInstance?.id}" />
					<g:link class="edit" action="edit" id="${bookInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
