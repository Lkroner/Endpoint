ENDPOINT.Collections.Reviews = Backbone.Collection.extend({
  initialize: function(opts){
    this.id = opts.id
  },
  model: ENDPOINT.Models.Review,
  url: '/apis/' + this.id + '/reviews'
})