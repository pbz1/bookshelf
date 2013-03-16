package pl.espeo.bookshelf

class Publisher {

    String name
	String description
	
	static hasMany = [books: Book]

    static constraints = {
		name blank: false
		description blank: true
    }
	
	static auditable = true
	
}
