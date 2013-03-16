<%@ page import="pl.espeo.bookshelf.Publisher" %>



<div class="fieldcontain ${hasErrors(bean: publisherInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="publisher.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${publisherInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publisherInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="publisher.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${publisherInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: publisherInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="publisher.books.label" default="Books" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${publisherInstance?.books?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="book" action="create" params="['publisher.id': publisherInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>
</li>
</ul>

</div>

