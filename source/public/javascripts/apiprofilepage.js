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

  // defaults: {
  //   "title": "Google",
  //   "description": "This is the Google Api This is the Google Api This is the Google ApiThis is the Google ApiThis is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api",
  //   "tips": "Read the docs. RTFM.",
  //   "average_score": "3.4",
  //   "logo_url": "http://www.efytimes.com/admin/useradmin/photo/google-mobile-app-store-logo.png",
  //   "data_type": "JSON",
  //   "doc_link": "www.google.com",
  //   "endpoint_link": "www.google.com/endpoints",
  //   "num_followers": 302
  // }

})

app.ApiProfile.Views.Profile = Backbone.View.extend({

  // hit the database with the api_id sent in from the search page, do an ajax call to get the model shit we need
  model: new app.ApiProfile.Models.Profile,

  events: {
    // event listeners for info tab, tips/tricks and links
  },

  initialize: function(opts){
    console.log("Api Profile view initialized")
    this.id = opts.id
    debugger
  },

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    console.log(this.model.attributes.logo_url)
    this.$el.html(this.template(this.model.attributes));
    return this;
  },
})
