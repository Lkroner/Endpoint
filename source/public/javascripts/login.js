app.LogIn = {
	Models: {},
	Collections: {},
	Views: {}
}

app.LogIn.Views.LoginPage = Backbone.View.extend({
	initialize: function(){
		console.log(this)
		console.log("Login view initialized")
	},

	template: _.template($('#login-template').html()),

	render: function() {
		debugger
		this.$el.html(this.template());
		return this;
	},
})