$('#validateForm').bootstrapValidator({
feedbackIcons: {
	valid: 'glyphicon glyphicon-ok',
	invalid: 'glyphicon glyphicon-remove',
	validating: 'glyphicon glyphicon-refresh'
},
fields: {
	username: {
		validators: {
			stringLength: {
				min: 5,
				message: 'Please Enter your Full name with minimum 5 letters length'
			},
			notEmpty: {
				message: 'Please Enter your Full name'
			}
		}
	},
	
	password: {
		validators: {
			notEmpty: {
				message: 'Enter your profile password'
			}
		}
	}
}
});