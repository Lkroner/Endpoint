ENDPOINT.Views.SignUpPage = Backbone.View.extend({
	initialize: function(){
	},
	
	events: {
		"click #submit": "clickSubmit"
	},

	clickSubmit: function(){
		this.email = $("input[name='email']").val();
		this.password = $("input[name='password']").val();
		this.model.save({email: this.email, password: this.password}).done(function(data){
			if (data.user) {
			$.cookie("user_id", data.user.id)
			ENDPOINT.router.navigate("", true)
			} else if (data.errors){
				errors = data.errors
				errorsHTML = ""
				for (var i = 0; i < errors.length; i++) {
					errorsHTML += errors[i] + "<br>"
				}
				$(".errors").html(errorsHTML)
			}
		});
	},

	template: _.template($('#signup-template').html()),
	render: function() {
		this.$el.html(this.template());
		return this;
	},
})