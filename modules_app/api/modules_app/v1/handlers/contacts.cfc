/**
 * Manage contacts
 * It will be your responsibility to fine tune this template, add validations, try/catch blocks, logging, etc.
 */
component extends="coldbox.system.RestHandler" {

	// DI
	property name="contactsService" inject="ContactsService@v1";

	/**
	 * Display a list of contacts
	 */
	function index( event, rc, prc ) {
		event.getResponse().setData( contactsService.list() );
	}

	/**
	 * Create a contact
	 */
	function create( event, rc, prc ) {
	}

	/**
	 * Show a contact
	 */
	function show( event, rc, prc ) {
		event
			.paramValue( "id", 0 )
			.getResponse()
			.setData( contactsService.get( rc.id ) );
	}

	/**
	 * Update a contact
	 */
	function update( event, rc, prc ) {
		event.paramValue( "id", 0 );
	}

	/**
	 * Delete a contact
	 */
	function delete( event, rc, prc ) {
		event.paramValue( "id", 0 );
	}

}
