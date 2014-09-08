app.ApiProfile = {
  Models: {},
  Collections: {},
  Views: {}
}

app.ApiProfile.Models.Profile = Backbone.Model.extend({

  // urlRoot: '/apis/:id',

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
app.ApiProfile.Models.Review = Backbone.Model.extend({

  // urlRoot: '/apis/:id/reviews',

  initialize: function(){
  },

  defaults: {
    "score": "",
    "content": "",
    "title": "",
    "created_at": "",
    "user_id": "",
    "user_photo_url": "",
    "comment_content": ""
  }

})


app.ApiProfile.Collections.Reviews = Backbone.Collection.extend({
  $el: '.api-reviews',
  initialize: function(opts){
    this.id = opts.id
  },
  model: app.ApiProfile.Models.Review,
  url: '/apis/' + this.id + '/reviews'
})


app.ApiProfile.Views.Reviews = Backbone.View.extend({
  // model: app.ApiProfile.Models.Review,
  collection: app.ApiProfile.Models.Reviews,

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
    var reviewObjects = new app.ApiProfile.Collections.Reviews(this.id);
    var that = this;

    reviewObjects.fetch({
      success: function(){
        debugger
        console.log(reviewObjects);
        that.$el.html(that.template(reviewObjects.attributes));
      }
    });
      // success: function(result){
      //   debugger
      //     reviewObjects.set(result.reviews);
      //     // debugger
      //     that.$el.html(that.template(reviewObjects.attributes));


    // console.log(this)
    // return this;
  },

  displayReviews: function(){
    console.log(reviewObjects);
  }
})
