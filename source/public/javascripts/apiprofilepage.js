app.ApiProfile = {
  Models: {},
  Collections: {},
  Views: {}
}

app.ApiProfile.Models.Profile = Backbone.Model.extend({

  urlRoot: '/apis/:id',

  initialize: function(){
  },

  defaults: {
    "title": "",
    "description": "",
    "tips": "",
    "average_score": "",
    "logo_url": "",
    "data_type": "",
    "doc_link": "",
    "endpoint_link": "",
    "num_followers": 0,
  }
})

app.ApiProfile.Views.Profile = Backbone.View.extend({
  model: app.ApiProfile.Models.Profile,

  initialize: function(opts){
    this.id = opts.id
  },

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    var apiObject = new this.model
    var that = this;
    $.ajax({
      url:'/apis/' + this.id,
      success: function(result){
        apiObject.set(result.api);
        that.$el.html(that.template(apiObject.attributes));
      }
    })
    return this;
  },
})

/////////////// Reviews Section
app.ApiProfile.Models.Reviews = Backbone.Model.extend({
  // do we intialize our model here?
  // we will pass the model into the view
  initialize: function(){
  },

  defaults: {
    "title": "Google",
    "description": "This is the Google Api This is the Google Api This is the Google ApiThis is the Google ApiThis is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api This is the Google Api",
    "tips": "Read the docs. RTFM.",
    "average_score": "3.4",
    "logo_url": "http://www.efytimes.com/admin/useradmin/photo/google-mobile-app-store-logo.png",
    "data_type": "JSON",
    "doc_link": "www.google.com",
    "endpoint_link": "www.google.com/endpoints",
    "num_followers": 302
  }

})

app.ApiProfile.Views.Reviews = Backbone.View.extend({

  // do an ajax call to get the reviews n shit we need
  model: new app.ApiProfile.Models.Reviews,

  initialize: function(){
  },

  template: _.template($('#apiprofile-template').html()),

  render2: function() {
    console.log('render2 called')
    this.$el.html(this.template(this.model.attributes));
    return this;
  },
})
