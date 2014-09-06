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
		// This is where login/logout event listeners go.
	},

	initialize: function(){
		console.log("Navbar view initialized")
	},

	template: _.template($('#navbar-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},

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

// Router
var Router = Backbone.Router.extend({
	routes: {
		"": "navigateToHome",
	},

	navigateToHome: function() {
		// var apiSearchResults = new ApiSearchResults

		var homeView = new HomeView ({
			// model: apiSearchResults
		});

		var navbar = new NavBar ({

		});

		console.log("You're in navigate home.");

		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(homeView.render().$el);
	}
});


var router = new Router();
Backbone.history.start()
