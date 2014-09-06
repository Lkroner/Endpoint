// Models
var ApiSearchResults = Backbone.Collection.extend({
	url: '/search',
	initialize: function() {
	  // console.log(this);
	}
});

// Views

var NavBar = Backbone.View.extend({
	events: {
		"click #login": "login",
		"click #sign-up": "signup"
	},

	initialize: function(router){
		console.log(router);
		console.log("Navbar view initialized")
	},

	template: _.template($('#navbar-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},

	login: function(){
		alert("wooot");
	},

	signup: function(){
		event.preventDefault();
		router.navigate("signup", true)
	}

});

var HomeView = Backbone.View.extend({
	events: {
		"click #search": "clickSearch"
	},

	initialize: function(){
		console.log("Home view initialized")
	},

	template: _.template($('#home-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},

	clickSearch: function() {
		console.log("You're in clickSearch.");
		alert("You clicked search!");
	}
})

var LogIn = Backbone.View.extend({
	initialize: function(){
		console.log("Login view initialized")
	},

	template: _.template($('#login-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},
})

// Router
var Router = Backbone.Router.extend({
	routes: {
		"": "navigateToHome",
		"signup": "navigateToSignUp"
	},

	navigateToHome: function(){
		var navbar = new NavBar();
		var homeView = new HomeView();
		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(homeView.render().$el);
	},

	navigateToSignUp: function(){
		var navbar = new NavBar();
		var login = new LogIn(router);
		$('#app-body').empty();
		$('#app-body').html(login.render().$el);
	}
});


var router = new Router();
Backbone.history.start()
