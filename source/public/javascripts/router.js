app.Router = Backbone.Router.extend({
	routes: {
		"": "navigateToHome",
		"signup": "navigateToSignUp",
		"login": "navigateToLogin",
		"searchResults": "navigateToSearchResults",
		"api/:id": "navigateToApiProfile"
	},

	navigateToHome: function(){
		var navbar = new app.NavBar.Views.NavBarView();
		var homeView = new app.HomePage.Views.HomeView();
		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(homeView.render().$el);
	},

	navigateToSignUp: function(){
		var navbar = new app.NavBar.Views.NavBarView();
		var login = new app.LogIn.Views.LoginPage(app.router);
		$('#app-body').empty();
		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(login.render().$el);
	},
	navigateToLogin: function(){
	},
	navigateToSearchResults: function(){
		var navbar = new app.NavBar.Views.NavBarView();
		var result = new app.SearchResults.View();
		result.render()
		$('#navbar').html(navbar.render().$el)
	},
	navigateToApiProfile: function(id){
		var navbar = new app.NavBar.Views.NavBarView();
		var apiprofile = new app.ApiProfile.Views.Profile({id: id});
		$('#app-body').empty();
		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(apiprofile.render().$el);
	}
});

(function(){
	app.router = new app.Router();
	Backbone.history.start()
})()
