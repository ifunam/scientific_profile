// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()    {
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
