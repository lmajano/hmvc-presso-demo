/**
 * Manage contacts
 * It will be your responsibility to fine tune this template, add validations, try/catch blocks, logging, etc.
 */
component extends="coldbox.system.EventHandler"{
	
	// DI 
	property name="contactsService" inject="ContactsService@v1";
	
	// HTTP Method Security
	this.allowedMethods = {
		index  		= "GET", 
		new    		= "GET", 
		create   	= "POST,PUT", 
		show 		= "GET", 
		edit		= "GET",
		update 		= "POST,PUT,PATCH",
		delete 		= "DELETE"
	};
	
	/**
	 * Param incoming format, defaults to `html`
	 */
	function preHandler( event, rc, prc ){
		event.paramValue( "format", "html" );
	}
		
	/**
	 * Display a list of contacts
	 */
	function index( event, rc, prc ){
		return contactsService.list();
	}

	/**
	 * Return an HTML form for creating one contact
	 */
	function new( event, rc, prc ){
		event.setView( "contacts/new" );
	}

	/**
	 * Create a contact
	 */
	function create( event, rc, prc ){
		
	}

	/**
	 * Show a contact
	 */
	function show( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "contacts/show" );
	}

	/**
	 * Edit a contact
	 */
	function edit( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "contacts/edit" );
	}

	/**
	 * Update a contact
	 */
	function update( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}

	/**
	 * Delete a contact
	 */
	function delete( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}
	
}
