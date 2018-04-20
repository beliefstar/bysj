
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch([
                    "/login_assets/img/backgrounds/2.jpg"
	              , "/login_assets/img/backgrounds/3.jpg"
	              , "/login_assets/img/backgrounds/1.jpg"
	             ], {duration: 3000, fade: 750});
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
        e.preventDefault();
        var flag = false;
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() === "" ) {
    			$(this).addClass('input-error');
    			flag = true;
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	if (flag) return;
    	var url = $(this).attr("action");
    	var data = $(this).serialize();
    	$.post(url, data, function (rel) {
			if (rel.status === 200) {
				window.location.href = "/";
			} else {
                $("#info").find("div").html(rel.message);
				$("#info").slideDown();
			}
        })
    });
    
    
});
