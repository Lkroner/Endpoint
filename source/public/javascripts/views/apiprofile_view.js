
ENDPOINT.Views.ApiProfile = Backbone.View.extend({
  model: ENDPOINT.Models.ApiProfile,

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