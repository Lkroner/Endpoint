app.SearchResults = {};

app.SearchResults.View = Backbone.View.extend({
  template: _.template($('#search-template').html()),

  ajaxRequest: function(){
    var input = $(".form-control").val()
    Backbone.ajax({
      url: "/search",
      type: "get",
      data: {input: input}
    }).done(function(data){
      var templates = ""
      for (var i = 0; i < data.apis.length; i++){
        templates += this.template(data.apis[i])
      }
      $('#app-body').empty();
      $('#app-body').append('<div id="search-list"></div>');
      $('#search-list').html(templates);
      $(".result").on('click', this.navigateToProfile);
    }.bind(this)).fail(function(){
    })
  },

  render: function(){
    this.ajaxRequest();
  },

  navigateToProfile: function(){
    event.preventDefault();
    var id = this.dataset.id
    app.router.navigate("api/" + id, true)
  }


})



