/**
* My RESTFul Event Handler
*/
component extends="api.handlers.BaseHandler"{
	
	/**
	* Index
	*/
	any function index( event, rc, prc ){
		prc.response.setData( "Welcome to my ColdBox RESTFul Service" );
	}
	
}