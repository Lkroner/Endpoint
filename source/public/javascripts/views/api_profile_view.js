
ENDPOINT.Views.ApiProfile = Backbone.View.extend({
  model: ENDPOINT.Models.ApiProfile,

  template: _.template($('#apiprofile-template').html()),

  render: function() {
    console.log("inside view render")
    this.$el.html(this.template(this.model.attributes.api));
    $("#app-body").append(this.$el);
    return this;
  },
})