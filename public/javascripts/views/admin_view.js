ENDPOINT.Views.AdminView = Backbone.View.extend({
  events: {
    "click #submit": "clickSubmit"
  },

  initialize: function(){
  },

  template: _.template($('#admin-template').html()),

  render: function() {
    this.$el.html(this.template());
  return this;
  },


  clickSubmit: function(){
    this.title = $("input[name='title']").val();
    this.description = $("input[name='description']").val();
    this.tips = $("input[name='tips']").val();
    this.logo_url = $("input[name='logo_url']").val();
    var thing = {title: this.title, description: this.description, tips: this.tips, logo_url: this.logo_url};
    Backbone.ajax({
      url: '/apis',
      type: 'POST',
      data: thing
    }).done(function(data){
      console.log("finished!")
    })
  },
})
