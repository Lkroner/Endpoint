ENDPOINT.Models.ReviewList = Backbone.Model.extend({
  initialize: function(opts){
    console.log("review list")
    this.set("url", opts.url)
  },

  url: function(){
    return this.attributes.url;
  }
})

ENDPOINT.Models.Review = Backbone.Model.extend({

})