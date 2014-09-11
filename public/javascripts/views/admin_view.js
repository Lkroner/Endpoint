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
    this.dev_homepage = $("input[name='dev_homepage']").val();
    this.key_required = $("input[name='key_required']").val();
    this.endpoint_url = $("input[name='endpoint_url']").val();
    this.category = $("input[name='category']").val();
    var thing = {title: this.title, description: this.description, tips: this.tips, logo_url: this.logo_url, dev_homepage: this.dev_homepage, key_required: this.key_required, endpoint_url: this.endpoint_url, category: this.category };
    Backbone.ajax({
      url: '/apis',
      type: 'POST',
      data: thing
    }).done(function(data){
      console.log("finished!")
      ENDPOINT.router.navigate("", true)
    })
  },
})
