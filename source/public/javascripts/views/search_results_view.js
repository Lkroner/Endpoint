ENDPOINT.Views.SearchResult = Backbone.View.extend({
  template: _.template($("#search-template").html()),

  render: function(){
    var filledTemplate = this.template(this.model.attributes);
    this.$el.html(filledTemplate)
    return this;
  }
})



ENDPOINT.Views.SearchResults = Backbone.View.extend({
  render: function(){
    $("#app-body").append('<div id="search-list"></div>');
    //search model is a place holder like in pipes
    this.collection.each(function(searchModel){
      var searchView = new ENDPOINT.Views.SearchResult({model: searchModel});
      $("#search-list").append(searchView.render().$el);
    })
    return this;
  }
})