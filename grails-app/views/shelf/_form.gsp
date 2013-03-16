<%@ page import="pl.espeo.bookshelf.Shelf" %>



<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="shelf.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${shelfInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="shelf.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${shelfInstance?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="shelf.books.label" default="Books" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shelfInstance?.books?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="book" action="create" params="['shelf.id': shelfInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>
</li>
</ul>

</div>

