app.SearchResults = {};

app.SearchResults.View = Backbone.View.extend({
  events: {
    "click a.list-group-item":"navigateToProfile"
  },

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
      $('#app-body').html(templates);
      $(".result").on('click', this.navigateToProfile);
    }.bind(this)).fail(function(){
    })
  },

  render: function(){
    this.ajaxRequest();
  },

  navigateToProfile: function(){
    console.log("navigated")
    event.preventDefault();
    var id = $(".container")[this.dataset.id]
    app.router.navigate("apiProfile", true, id)
  }


})



