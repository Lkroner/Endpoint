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

  urlRoot: '/apis/:id/reviews',

  initialize: function(){
  },

  defaults: {
    "score": "",
    "content": "",
    "title": "",
    "created_at": "",
    "user_id": ""
  }

})

app.ApiProfile.Views.Reviews = Backbone.View.extend({
  model: app.ApiProfile.Models.Reviews,

  initialize: function(opts){
    this.id = opts.id
  },

  events: {
    "click .comment-toggler": "toggleComments"
  },

  toggleComments: function(e){
    e.preventDefault();
    $('.comment-area').toggle()
  },

  template: _.template($('#apireviews-template').html()),

  render: function() {
    var reviewObject = new this.model
    var that = this;
    $.ajax({
      url:'/apis/' + this.id + '/reviews',
      success: function(result){
        reviewObject.set(result.reviews);
        that.$el.html(that.template(reviewObject.attributes));
      }
    })
    console.log(this)
    return this;
  },
})
