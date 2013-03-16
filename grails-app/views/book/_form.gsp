<%@ page import="pl.espeo.bookshelf.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="255" required="" value="${bookInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'oryginalTitle', 'error')} ">
	<label for="oryginalTitle">
		<g:message code="book.oryginalTitle.label" default="Oryginal Title" />
		
	</label>
	<g:textField name="oryginalTitle" value="${bookInstance?.oryginalTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="book.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${pl.espeo.bookshelf.Author.list()}" optionKey="id" required="" value="${bookInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'translator', 'error')} ">
	<label for="translator">
		<g:message code="book.translator.label" default="Translator" />
		
	</label>
	<g:select id="translator" name="translator.id" from="${pl.espeo.bookshelf.Author.list()}" optionKey="id" value="${bookInstance?.translator?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publisher', 'error')} ">
	<label for="publisher">
		<g:message code="book.publisher.label" default="Publisher" />
		
	</label>
	<g:select id="publisher" name="publisher.id" from="${pl.espeo.bookshelf.Publisher.list()}" optionKey="id" value="${bookInstance?.publisher?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publishedDate', 'error')} ">
	<label for="publishedDate">
		<g:message code="book.publishedDate.label" default="Published Date" />
		
	</label>
	<g:datePicker name="publishedDate" precision="day"  value="${bookInstance?.publishedDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'holder', 'error')} ">
	<label for="holder">
		<g:message code="book.holder.label" default="Holder" />
		
	</label>
	<g:select id="holder" name="holder.id" from="${pl.espeo.bookshelf.User.list()}" optionKey="id" value="${bookInstance?.holder?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'introUrl', 'error')} ">
	<label for="introUrl">
		<g:message code="book.introUrl.label" default="Intro Url" />
		
	</label>
	<g:field type="url" name="introUrl" value="${bookInstance?.introUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} ">
	<label for="isbn">
		<g:message code="book.isbn.label" default="Isbn" />
		
	</label>
	<g:textField name="isbn" value="${bookInstance?.isbn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'pages', 'error')} required">
	<label for="pages">
		<g:message code="book.pages.label" default="Pages" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pages" type="number" value="${bookInstance.pages}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="book.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${bookInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="book.categories.label" default="Categories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bookInstance?.categories?}" var="c">
    <li><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="category" action="create" params="['book.id': bookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'category.label', default: 'Category')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'shelf', 'error')} required">
	<label for="shelf">
		<g:message code="book.shelf.label" default="Shelf" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shelf" name="shelf.id" from="${pl.espeo.bookshelf.Shelf.list()}" optionKey="id" required="" value="${bookInstance?.shelf?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="book.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${pl.espeo.bookshelf.Status?.values()}" keys="${pl.espeo.bookshelf.Status.values()*.name()}" required="" value="${bookInstance?.status?.name()}"/>
</div>

