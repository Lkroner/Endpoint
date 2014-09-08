app.ApiProfile = {
  Models: {},
  Collections: {},
  Views: {}
}

app.ApiProfile.Models.Profile = Backbone.Model.extend({

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
  initialize: function(opts){
    this.id = opts.id
  },
  model: app.ApiProfile.Models.Review,
  url: '/apis/' + this.id + '/reviews'
})


app.ApiProfile.Views.Reviews = Backbone.View.extend({
  model: app.ApiProfile.Models.Review,

  initialize: function(opts){
    this.id = opts.id
  },

  events: {
    "click .comment-toggler": "toggleComments",
    "click #submit": "submitReview",
    "click .votes": "upVote"
  },

  upVote: function(event){
    var user_id = $.cookie("user_id")
    var review_id = $(event.target).closest(".single-review")[0].dataset.id
    //if user is logged in 
    if ($.cookie("user_id")){
      Backbone.ajax({
        url: '/reviews/' + review_id + '/votes',
        type: 'POST',
        data: {user_id: user_id, review_id: review_id}
      })    
      .done(function(data){
        var newVoteCount = data.vote_count
        review = $("[data-id='"+ data.review_id + "'][class='single-review row']")
        review.find(".vote-count").text(newVoteCount + " votes")
      })
      .fail(function(){
        alert("You can only vote once!")
      })
    } else {
      app.router.navigate("login", true)
      $(".errors").html("You must be logged in to upvote!")
    }
  },


  toggleComments: function(e){
    e.preventDefault();
    $('.comment-area').toggle()
  },

  reviewsTemplate: _.template($('#apireviews-template').html()),
  singleReviewTemplate: _.template($('#singlereview-template').html()),
  render: function() {
    var reviewObject = new this.model();
    var that = this;
    Backbone.ajax({
    url: '/apis/' + that.id + '/reviews',
    type: 'GET'
    }).done(function(data){
      allReviewsHTML = ""
      for(var i=0; i< data.reviews.length; i++){
        reviewObject.set(data.reviews[i]);
        var templates = that.$el.html(that.singleReviewTemplate(reviewObject.attributes));

        allReviewsHTML += templates[0].innerHTML
      };
      $("#app-body").append(that.$el.html(that.reviewsTemplate()));
      $("#tab4").append(allReviewsHTML);
    })
  },

  submitReview: function(){
    event.preventDefault();
    Backbone.ajax({
    url: '/apis/' + this.id + '/reviews',
    type: 'POST',
    data: $('.reviewSubmission').serialize()
    }).done(function(data){
      console.log('success');
      $('.feedback-success').toggle()
    }).fail(function(){
      console.log(errors)
    });
  }
})

