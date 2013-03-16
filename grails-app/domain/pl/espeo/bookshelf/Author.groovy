package pl.espeo.bookshelf

class Author {

    String firstName
	String lastName
	String info

	static hasMany = [books: Book]
	
    static constraints = {
		firstName blank: false
		lastName blank: false
		info blank: true
    }
	
	static auditable = true
	
}
