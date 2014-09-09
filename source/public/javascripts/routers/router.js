ENDPOINT.Routers = Backbone.Router.extend({
	routes: {
		"": "navigateToHome",
		"signup": "navigateToSignUp",
		"login": "navigateToLogin",
		"search=:query": "navigateToSearchResults",
		"api/:id": "navigateToApiProfile"
	},


	resetBody: function(){
		$('#app-body').empty();
		var hasNavbar = false
		for (var i = 0 ; i < ENDPOINT.CurrentState.Views.length; i++) {
			ENDPOINT.CurrentState.Views[i].remove();
			if(ENDPOINT.CurrentState.Views[i].isNavbar){
				hasNavbar = true;
			}
		}
		if (!hasNavbar){
			var navbar = new ENDPOINT.Views.NavBarView({isNavbar: true});
			$('#navbar').html(navbar.render().$el)
		}
		ENDPOINT.CurrentState.Views = [];
	},

	navigateToHome: function(){
		this.resetBody();
		this.toggleNavBar();
	    var homeView = new ENDPOINT.Views.HomeView();
		ENDPOINT.CurrentState.Views.push(homeView)
		$('#app-body').html(homeView.render().$el);
	},

	navigateToSignUp: function(){
		this.resetBody();
		this.toggleNavBar();
		var signup = new ENDPOINT.Views.SignUpPage(ENDPOINT.router);
		$('#app-body').html(signup.render().$el);
	},

	navigateToLogin: function(){
		this.resetBody()
		this.toggleNavBar();
		var login = new ENDPOINT.Views.LoginPage(ENDPOINT.router);
		$("#app-body").html(login.render().$el);
	},

	navigateToSearchResults: function(query){
		this.resetBody();
		this.toggleNavBar();
		console.log("in navigate")
		var searchModel = new ENDPOINT.Models.Search({input: query});
		searchModel.fetch({data: {input: searchModel.get("input")}}).done(function(data){
			var searchResultCollection = new ENDPOINT.Collections.SearchResults(data.apis);
			var searchResultsView = new ENDPOINT.Views.SearchResults({collection: searchResultCollection});
			searchResultsView.render().$el;
		})
	},

	navigateToApiProfile: function(id){
		this.resetBody();
		this.toggleNavBar();
		var apiProfileModel = new ENDPOINT.Models.ApiProfile({url: "/apis/"+ id});
		apiProfileModel.fetch().done(function(data){
			var apiProfileView = new ENDPOINT.Views.ApiProfile({model: apiProfileModel})
			apiProfileView.render().$el;
		});

		var reviewListModel = new ENDPOINT.Models.ReviewList({url: "/apis/"+id+"/reviews"})
		reviewListModel.fetch().done(function(data){
			var reviewsCollection = new ENDPOINT.Collections.Reviews(data.reviews);

			var reviewsView = new ENDPOINT.Views.Reviews({collection: reviewsCollection});
			debugger
			reviewsView.render();
		});

	},

	toggleNavBar: function(){
		if ($.cookie("user_id")){
			$("#logout").toggleClass("hidden")
		} else {
			$("#login").toggleClass("hidden")
			$("#sign-up").toggleClass("hidden")
		}
	}

});

(function(){
	ENDPOINT.router = new ENDPOINT.Routers();
	Backbone.history.start()
})()
