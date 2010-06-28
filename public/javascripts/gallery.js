$(document).ready(function()    {
	var authToken = $('meta[name=csrf-token]').attr('content');
	var authKey = $('meta[name=csrf-param]').attr('content');
	var myHash = { };
	myHash[authKey] = encodeURIComponent(authToken);
	var gallery_id = $('#image_gallery_id').val();
	$('#fileInput').uploadify({
		'uploader': '/flash/uploadify/uploadify.swf',
		'script': '/galleries/'+ gallery_id +'/images/',
		'cancelImg': '/images/uploadify/cancel.png',
		'multi': true,
		'auto': true,
		'fileExt': '*.jpg;*.gif;*.png;*.jpeg',
		'fileDesc': 'File Description',
		'fileDataName': 'image[file]',
		'buttonText': 'Agregar archivos',
		'width': 110,
		'height': 28,
		'queueID': 'uploadify_queueID',
		'scriptData': myHash,
		'onComplete': function(e, queueID, fileObj, response, data) {
			$.ajax({
				url: JSON.parse(response)['image'],
				success: function(request) { $('#images').append(request); }
			});
			return true;
		}
	});


	$("#image-dialog").dialog({
		title: "Imagen",
		bgiframe: true,
		height: 400,
		width: 600,
		draggable: false,
		modal: false,
		autoOpen: false,
		resizable: true
	});
});
