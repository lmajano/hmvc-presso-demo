/**
 * I manage contact
 */
component singleton accessors="true" {

	// Properties
	property name="mockdata" inject="mockdata@mockdataCFC";

	/**
	 * Constructor
	 */
	ContactsService function init() {
		variables.data = [];
		return this;
	}

	function onDIComplete() {
		variables.data = mockdata.mock(
			$num        = 100,
			name        = "name",
			age         = "age",
			id          = "autoincrement",
			createdDate = "datetime",
			email       = "email"
		);
	}

	/**
	 * save
	 */
	function save() {
	}

	/**
	 * delete
	 */
	function delete() {
	}

	/**
	 * list
	 */
	function list() {
		return variables.data;
	}

	/**
	 * Get a contact
	 */
	function get( contactId ) {
		return variables.data.filter( ( row ) => row.id == contactId ).reduce( ( result, row ) => row, {} );
	}

}
