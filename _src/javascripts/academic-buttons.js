$('.tab').on('click', function(e){
	e.preventDefault();

	var clickedElement = $(this);
	var contentID = $(this).data('content');

	$('.button.active, .details-item.active').removeClass('active');
	clickedElement.addClass('active');

	$(contentID).addClass('active');
	$(contentID + " h3").focus();
});