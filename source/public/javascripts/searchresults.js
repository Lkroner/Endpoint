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
      debugger
      $('#app-body').empty();
      $('#app-body').html(templates);
    }.bind(this)).fail(function(){
      $('#app-body').empty();
      $('#app-body').html("<p>you suck</p>");
    })
  },

  render: function(){
    this.ajaxRequest();
    console.log("rendering")
  }

})



