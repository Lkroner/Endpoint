ENDPOINT.Views.Reviews = Backbone.View.extend({
  model: ENDPOINT.Models.Review,

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
      EDNPOINT.router.navigate("login", true)
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