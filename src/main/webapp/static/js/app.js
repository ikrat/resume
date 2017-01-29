;$(function(){
	
	var init = function(){
		showMessageModal();
	}
	
	var showMessageModal = function() {
		var message = $('#modal-message').attr('data-message');
		if (message !== '') {
			$('#modal-message').modal('show');
			setTimeout(function() {
				$('#modal-message').modal('hide');
			}, 3000);
		};
	};
	
	init();
});

var resume = {
	alert : function(message) {
		alert(message);
	},

	moreProfiles : function() {
		var page = parseInt($('#profileContainer').attr('data-profile-number')) + 1;
		var total = parseInt($('#profileContainer').attr('data-profile-total'));
		if (page >= total) {
			$('#loadMoreIndicator').remove();
			$('#loadMoreContainer').remove();
			return;
		}
		var url = '/fragment/more?page=' + page;

		$('#loadMoreContainer').css('display', 'none');
		$('#loadMoreContainer').css('display', 'block');
		$.ajax({
			url : url,
			success : function(data) {
				$('#loadMoreIndicator').css('display', 'none');
				$('#profileContainer').append(data);
				$('#profileContainer').attr('data-profile-number', page);
				if (page >= total - 1) {
					$('#loadMoreIndicator').remove();
					$('#loadMoreContainer').remove();
				} else {
					$('#loadMoreContainer').css('display', 'block');
				}
			},
			error : function(data) {
				$('#loadMoreIndicator').css('display', 'none');
				resume.alert('Error! Try again later...');
			}
		});
	}
};
