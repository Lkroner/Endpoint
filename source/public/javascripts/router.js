app.Router = Backbone.Router.extend({
	routes: {
		"": "navigateToHome",
		"signup": "navigateToSignUp",
		"login": "navigateToLogin",
		"searchResults": "navigateToSearchResults",
		"apiProfile": "navigateToApiProfile"
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

	},
	navigateToApiProfile: function(){
		var navbar = new app.NavBar.Views.NavBarView();
		var apiprofile = new app.ApiProfile.Views.Profile();
		$('#app-body').empty();
		$('#navbar').html(navbar.render().$el)
		$('#app-body').html(apiprofile.render().$el);
	}
});

(function(){
	app.router = new app.Router();
	Backbone.history.start()
})()
