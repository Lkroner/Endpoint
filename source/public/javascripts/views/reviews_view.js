ENDPOINT.Views.Review = Backbone.View.extend({
  template: _.template($("#singlereview-template").html()),

  render: function(){
    var filledTemplate = this.template(this.model.attributes);
    this.$el.html(filledTemplate)
    return this;
  }
})

ENDPOINT.Views.Reviews = Backbone.View.extend({

  template: _.template($("#apireviews-template").html()),

  render: function(){
    $("#app-body").append(this.template());
    this.collection.each(function(reviewModel){
      var reviewView = new ENDPOINT.Views.Review({model: reviewModel});
      $("#tab4").append(reviewView.render().$el);
    })
    return this;
  }


})