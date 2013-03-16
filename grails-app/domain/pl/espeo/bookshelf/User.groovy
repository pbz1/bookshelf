package pl.espeo.bookshelf

class User {

    String login
	String info
	String email
	Role role

    static constraints = {
	    login size: 3..32, blank: false, unique: true
		info nullable: true
		email email:true
    }
	
	static auditable = true
	
}
