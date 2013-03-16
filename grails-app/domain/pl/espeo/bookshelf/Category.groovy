package pl.espeo.bookshelf

class Category {

    String name
	String description
	
	static belongsTo = [book: Book]
	//static hasMany = [books: Book]

    static constraints = {
		name blank: false
		description blank: true
    }
	
	static auditable = true
	
}
