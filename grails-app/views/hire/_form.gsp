<%@ page import="pl.espeo.bookshelf.Hire" %>



<div class="fieldcontain ${hasErrors(bean: hireInstance, field: 'book', 'error')} required">
	<label for="book">
		<g:message code="hire.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${pl.espeo.bookshelf.Book.list()}" optionKey="id" required="" value="${hireInstance?.book?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hireInstance, field: 'holder', 'error')} required">
	<label for="holder">
		<g:message code="hire.holder.label" default="Holder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="holder" name="holder.id" from="${pl.espeo.bookshelf.User.list()}" optionKey="id" required="" value="${hireInstance?.holder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hireInstance, field: 'hireDate', 'error')} required">
	<label for="hireDate">
		<g:message code="hire.hireDate.label" default="Hire Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="hireDate" precision="day"  value="${hireInstance?.hireDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: hireInstance, field: 'returnDate', 'error')} ">
	<label for="returnDate">
		<g:message code="hire.returnDate.label" default="Return Date" />
		
	</label>
	<g:datePicker name="returnDate" precision="day"  value="${hireInstance?.returnDate}" default="none" noSelection="['': '']" />
</div>

