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
  // $el: '.api-reviews',
  initialize: function(opts){
    this.id = opts.id
  },
  model: app.ApiProfile.Models.Review,
  url: '/apis/' + this.id + '/reviews'
})

app.ApiProfile.Views.NavBarView = Backbone.View.extend({
  template: _.template($('#apireviews-navbar').html()),
  render: function() {
    this.$el.html(this.template());
  }
})

app.ApiProfile.Views.Reviews = Backbone.View.extend({
  // model: app.ApiProfile.Models.Review,
  model: app.ApiProfile.Models.Review,

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

  reviewsTemplate: _.template($('#apireviews-template').html()),
  singleReviewTemplate: _.template($('#singlereview-template').html()),
  render: function() {
    var reviewObject = new this.model;
    var that = this;
     Backbone.ajax({
      url: '/apis/' + that.id + '/reviews',
      type: 'GET'
      }).done(function(data){
        // debugger
        console.log(data);
        allReviewsHTML = ""
        for(var i=0; i< data.reviews.length; i++){
          console.log(i)
          // debugger
          reviewObject.set(data.reviews[i]);
          // debugger
          // debugger
          var templatesss = that.$el.html(that.singleReviewTemplate(reviewObject.attributes));
          // debugger
          allReviewsHTML += templatesss[0].innerHTML
          // debugger
          // var template1 = that.$el
          // debugger

        };

        $("#app-body").append(that.$el.html(that.reviewsTemplate()));
        $("#tab4").append(allReviewsHTML);
        // $("#tab4").append(allReviewsHTML);
        // debugger
      })
    }
      // success: function(result){
      //   debugger
      //     reviewObjects.set(result.reviews);
      //     // debugger
      //     that.$el.html(that.template(reviewObjects.attributes));


    // console.log(this)
    // return this;


})
