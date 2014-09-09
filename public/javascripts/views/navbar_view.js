
ENDPOINT.Views.NavBarView = Backbone.View.extend({
	events: {
		"click #login": "login",
		"click #sign-up": "signup",
		"click #logout": "logout"
	},

	initialize: function(){
	},

	template: _.template($('#navbar-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},

	login: function(){
		event.preventDefault()
		ENDPOINT.router.navigate("login", true)
	},

	signup: function(){
		event.preventDefault();
		ENDPOINT.router.navigate("signup", true)
	},

	logout: function(){
		$.removeCookie('user_id', { path: '/' })
		ENDPOINT.router.navigate("", true)
	}
});