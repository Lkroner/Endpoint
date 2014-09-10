ENDPOINT.Views.SearchResult = Backbone.View.extend({
  template: _.template($("#search-template").html()),

  render: function(){
    debugger
    var filledTemplate = this.template(this.model.attributes);
    this.$el.html(filledTemplate)
    return this;
  }
})


ENDPOINT.Views.SearchResults = Backbone.View.extend({
  render: function(){
    $("#app-body").append('<div id="search-list"></div>');
    this.collection.each(function(searchModel){
      var searchView = new ENDPOINT.Views.SearchResult({model: searchModel});
      $("#search-list").append(searchView.render().$el);
    })
    $(".result").on('click', this.navigateToProfile)
    return this;
  },

  navigateToProfile: function(){
    event.preventDefault();
    var id = this.dataset.id
    ENDPOINT.router.navigate("api/"+id, true)
  }
})