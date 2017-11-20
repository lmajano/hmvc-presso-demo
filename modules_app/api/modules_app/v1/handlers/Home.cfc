/**
* A normal ColdBox Event Handler
*/
component{

	property name="mockdata" inject="mockdata@mockdatacfc";

	function index(event,rc,prc){
		var data = mockdata.mock(
			"num" = 10,
			"name" = "name",
			"age" = "age",
			"id"  = "uuid"
		);
		return data;
	}

}
