// Models
var ApiSearchResults = Backbone.Collection.extend({
	url: '/search',
	initialize: function() {
	  // console.log(this);
	}
});


// Views
var HomeView = Backbone.View.extend({
	events: {
		"click #search": "clickSearch"
	},

	initialize: function(){
		console.log("View initialized")
	},

	template: _.template($('#home-template').html()),
	// template: _.template($('nav'))

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

		console.log("You're in navigate home.");

		$('#container').html(homeView.render().$el);
	}
});


var router = new Router();
Backbone.history.start()
