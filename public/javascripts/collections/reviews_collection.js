ENDPOINT.Collections.Reviews = Backbone.Collection.extend({
  initialize: function(opts){
    this.url = "/apis/" + opts.api_id +  "/reviews"
  },
  model: ENDPOINT.Models.Review
})