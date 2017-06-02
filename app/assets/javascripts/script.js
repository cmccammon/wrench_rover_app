
    	//to prevent unexpected top navigation menu close when using some components (like accordion, tabs, forms, etc)
    	$( window ).load(function() {
    	    $(document).on('click', '.navbar .dropdown-menu', function(e) {e.stopPropagation();});
    	});
