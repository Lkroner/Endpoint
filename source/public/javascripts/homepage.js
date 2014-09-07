app.HomePage = {
	Models: {},
	Collections: {},
	Views: {}
}

app.HomePage.Views.HomeView = Backbone.View.extend({
	events: {
		"click #search": "clickSearch"
	},

	initialize: function(){
	},

	template: _.template($('#home-template').html()),

	render: function() {
		this.$el.html(this.template());
		return this;
	},

	clickSearch: function() {
		console.log("You're in clickSearch.");
		alert("You clicked search!");
		app.router.navigate("searchResults", true)
	}
})