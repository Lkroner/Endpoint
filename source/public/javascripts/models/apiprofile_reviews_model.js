ENDPOINT.Models.ReviewList = Backbone.Model.extend({
  initialize: function(opts){
    this.set("url", opts.url)
    // debugger
    // this.save
    debugger
  },

  url: function(){
    return this.attributes.url;
    debugger
  }
})

ENDPOINT.Models.Review = Backbone.Model.extend({
})