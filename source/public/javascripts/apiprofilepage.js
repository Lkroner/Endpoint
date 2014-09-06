app.ApiProfile = {
  Models: {},
  Collections: {},
  Views: {}
}

app.ApiProfile.Models.Profile = Backbone.Models.extend({
  // do we intialize our model here?
  // we will pass the model into the view
})

app.ApiProfile.Views.Profile = Backbone.View.extend({
  className: 'api',

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
    this.$el.html(this.template());
    return this;
  },

  clickInfo: function() {
    console.log("You're in clickInfo.");
    console.log(this.$el);
  },

  clickTips: function() {
    console.log("You're in tips.");
  },

  clickLinks: function() {
    console.log("You're in clickLinks.");
  }
})
