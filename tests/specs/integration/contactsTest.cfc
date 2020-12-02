/*******************************************************************************
 *	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
 *
 *	Extends the integration class: coldbox.system.testing.BaseTestCase
 *
 *	so you can test your ColdBox application headlessly. The 'appMapping' points by default to
 *	the '/root' mapping created in the test folder Application.cfc.  Please note that this
 *	Application.cfc must mimic the real one in your root, including ORM settings if needed.
 *
 *	The 'execute()' method is used to execute a ColdBox event, with the following arguments
 *	* event : the name of the event
 *	* private : if the event is private or not
 *	* prePostExempt : if the event needs to be exempt of pre post interceptors
 *	* eventArguments : The struct of args to pass to the event
 *	* renderResults : Render back the results of the event
 *******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/" {

	property name="jwtService" inject="provider:JwtService@cbsecurity";
	property name="cbauth"     inject="provider:authenticationService@cbauth";

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll() {
		super.beforeAll();

		// Wire Up the Test
		getWireBox().autowire( this );

		// Make sure nothing is logged in to start our calls
		cbauth.logout();
		jwtService.getTokenStorage().clearAll();
	}

	function afterAll() {
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run() {
		describe( "Contacts", function() {
			beforeEach( function( currentSpec ) {
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();

				// Log in first to get a valid token to use for the request
				var token = jwtService.attempt( "admin@coldbox.org", "admin" );
				getRequestContext().setValue( "x-auth-token", token );
			} );

			it( "can retrieve all database contacts", function() {
				var event = get( "/api/v1/contacts" );
				// expectations go here.
				expect( event.getResponse().getStatusCode() ).toBe( 200 );
				debug( event.getResponse().getData() );
				expect( event.getResponse().getData() ).toBeArray();
			} );

			it( "can show a single contact", function() {
				var event = get( "/api/v1/contacts/2" );
				// expectations go here.
				expect( event.getResponse().getStatusCode() ).toBe( 200 );
				debug( event.getResponse().getData() );
				expect( event.getResponse().getData() ).toBeStruct();
				expect( event.getResponse().getData().id ).toBe( 2 );
			} );
		} );
	}

}
