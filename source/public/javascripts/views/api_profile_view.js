
ENDPOINT.Views.ApiProfile = Backbone.View.extend({
  model: ENDPOINT.Models.ApiProfile,

  initialize: function(opts){
    this.id = opts.id
  },

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    this.$el.html(this.template(this.model.attributes.api));
    $("#app-body").append(this.$el);
    return this;
  },
})