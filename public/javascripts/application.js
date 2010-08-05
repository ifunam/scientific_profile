// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()    {

	current_year = new Date().getFullYear();
	start_year = current_year - 100;
	end_year = current_year - 15;
	$('#user_person_attributes_birthdate').datepicker({ changeYear: true, changeMonth: true, yearRange: start_year+':'+end_year, dateFormat: 'dd-mm-yy', defaultDate: '01-01-'+end_year });


	$('#page_body').markItUp(mySettings);

	$('.add').click(function() {
		$.markItUp( { 
			openWith:'<opening tag>',
			closeWith:'<\/closing tag>',
			placeHolder:"New content"
		}
	);

	return false;
   });

   $('.toggle').click(function() {
	if ($("#page_body.markItUpEditor").length === 1) {
		$("#page_body").markItUpRemove();
		$("span", this).text("get markItUp! back");
	} else {
		$('#page_body').markItUp(mySettings);
		$("span", this).text("remove markItUp!");
	}
	return false;
   });

});
