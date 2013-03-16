package pl.espeo.bookshelf

class Book {

    String title
	String oryginalTitle
	Author author
	Author translator
	Publisher publisher
	Date publishedDate
	String isbn
	Integer pages
	String description
	String introUrl
	Status status
	User holder
	
	static belongsTo = [shelf: Shelf]
	static hasMany = [categories: Category]

    static constraints = {
	    title blank: false, size: 3..255
		oryginalTitle nullable: true
		author nullable: false
	    translator nullable: true
		publisher nullable: true
		publishedDate nullable: true
		holder nullable: true
		introUrl url: true, nullable: true
		isbn blank: true
		pages blank: true
		description blank: true
    }
	
	static mapping = {
        description type: 'text'
    }
	
	static auditable = true
	
}
