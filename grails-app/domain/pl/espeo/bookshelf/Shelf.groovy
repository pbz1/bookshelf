package pl.espeo.bookshelf

class Shelf {

    String name
	String position
	
    static hasMany = [books: Book]
	
    static constraints = {
		name blank: false
		position blank: true
    }
	
	static auditable = true
	
}
