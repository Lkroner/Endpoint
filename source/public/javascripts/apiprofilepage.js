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
    // "reviews": ""
  }

})

// var profile = new app.ApiProfile.Models.Profile

app.ApiProfile.Views.Profile = Backbone.View.extend({

  // hit the database with the api_id sent in from the search page, do an ajax call to get the model shit we need
  model: app.ApiProfile.Models.Profile,

  initialize: function(opts){
    console.log("Api Profile view initialized")
    this.id = opts.id
  },

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    console.log(this.id)
    var apiObject = new this.model
    var that = this;
    $.ajax({
      url:'/apis/' + this.id,
      success: function(result){
        console.log("successful call")
        console.log(result)
        console.log(apiObject)
        apiObject.set({title: result.api.title, average_score: result.api.average_score, data_type: result.api.data_type, description: result.api.description, doc_link: result.api.doc_link, endpoint_link: result.api.endpoint_link, logo_url: result.api.logo_url, num_followers: result.api.num_followers, tips: result.api.tips});
        console.log(apiObject)
        that.$el.html(that.template(apiObject.attributes));
            debugger
      }
    })
    return this;
  },
})
