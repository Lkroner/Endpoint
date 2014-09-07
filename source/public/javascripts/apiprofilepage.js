app.ApiProfile = {
  Models: {},
  Collections: {},
  Views: {}
}

app.ApiProfile.Models.Profile = Backbone.Model.extend({
  // do we intialize our model here?
  // we will pass the model into the view
  initialize: function(){
  },

  defaults: {
    "title": "Google",
    "description": "This is the Google Api",
    "tips": "Read the docs. RTFM.",
    "averge_score": "3.4",
    "logo_url": "http://9to5google.files.wordpress.com/2013/09/new-google-logo-knockoff.png?w=704&h=273"
  }

})

app.ApiProfile.Views.Profile = Backbone.View.extend({

  model: new app.ApiProfile.Models.Profile,

  events: {
    "click #info": "clickInfo",
    "click #tips": "clickTips",
    "click #links": "clickLinks"
    // event listeners for info tab, tips/tricks and links
  },

  initialize: function(){
    console.log("Api Profile view initialized")
  },

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    console.log(this.model.attributes.logo_url)
    this.$el.html(this.template(this.model.attributes));
    return this;
  },

  clickInfo: function() {
    console.log("You're in clickInfo.");
    console.log(model.attributes.title);
  },

  clickTips: function() {
    console.log("You're in tips.");
  },

  clickLinks: function() {
    console.log("You're in clickLinks.");
  }
})
