app.SignUp = {
	Models: {},
	Collections: {},
	Views: {}
}

app.SignUp.Views.SignUpPage = Backbone.View.extend({
	initialize: function(){
	},
	
	events: {
		"click #submit": "clickSubmit"
	},

	clickSubmit: function(){
		var email = $("input[name='email']").val()
		var password = $("input[name='password']").val()
		debugger
	},

	template: _.template($('#signup-template').html()),
	render: function() {
		this.$el.html(this.template());
		return this;
	},
})