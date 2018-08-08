// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require jquery.validate
//= require_tree .


$(document).ready(function(){

	$(".openPhotoModal").on('click', function(event){

		$('#photoModal').modal('show');

		//var photoId = $(this).attr("data-id");
		var photoTitle = $(this).find(".photo-title").text();
		var photoDescription = $(this).find(".photo-description").text();
		var photoImage = $(this).find(".card-img").next().attr('src');

		$('.modal-title').text(photoTitle);
		$('.modal-body img').attr("src", photoImage);
		$('.modal-footer').text(photoDescription);


	});

})

$.ajax({
	
});