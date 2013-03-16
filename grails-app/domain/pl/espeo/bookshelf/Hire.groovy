package pl.espeo.bookshelf

class Hire {

    Book book
	User holder
	Date hireDate
	Date returnDate

    static constraints = {
		book nullable: false
		holder nullable: false
		hireDate nullable: false
		returnDate nullable: true
    }
	
}
