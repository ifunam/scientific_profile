$(document).ready(function()    {
  $('#new_journal_form').live('click',function(){
       new_journal_dialog();
 	  return false;
	});

   $('#autocomplete_journal_search').live('focus', function(){
   	autocomplete_for_journal_search();
   });

   $('#change_journal').live('click', function() {
      journal_autocomplete_form();
   });
});


function autocomplete_for_journal_search() {
    $('#autocomplete_journal_search').autocomplete({
           	source: '/journals/autocomplete_search',
            minLength: 3,
            select: function(event, ui) {  var hidden = $('#article_journal_id');
                       hidden.val(ui.item.id);
                       journal_show(ui.item.id);
            }
        });
}

function journal_show(id) {
        $.ajax({
                url: "/journals/" + id + ".js", 
                success: function(request) { 
                        $("#journal_name").html(request); 
                }
        });
}

function journal_autocomplete_form() {
        $.ajax({
                url: "/journals/autocomplete_form", 
                success: function(request) { $("#journal_name").html(request); }
        });
}

function new_journal_dialog() {
        $("#dialog").dialog({
                title: "Journal",
                bgiframe: true,
                height: 150,
                width: 550,
                draggable: false,
                modal: false,
                autoOpen: false,
                resizable: false,
        });

        $('#dialog').dialog('open');
        $.ajax({
                url: "/journals/new.js",
                success: function(request) {
                        $("div#dialog").html(request);
                }
        });
        return false;
}

