app.SearchResults = {};

app.SearchResults.Model = Backbone.Model.extend({
  urlRoot: "/search"
  // fetch: function(options){
  //   var options = _.clone(options);

  //   options.userInput = $(".form-control").val();

  //   Backbone.sync.apply(this, options)
  // }
});



var MyView = Backbone.View.extend({
    initialize: function() {
        this.model = new UserModel();
        this.listenTo(this.model, 'sync', this.render);
        this.model.fetch();
    },
    render: function() {
        alert('My model loaded: ' + this.model.toJSON());
    }
});

// app.SearchResults.Collection = Backbone.Collection.extend({
//   model: app.SearchResults.Model,
//   url: "/search"
// })

app.SearchResults.View = Backbone.View.extend({
  initialize: function(){
    var searchModel = new app.SearchResults.Model({userInput: $(".form-control").val()})
    searchModel.fetch({
      success: function(searchModel){
        console.log(searchModel.toJSON());
      }
    })

  }

  // render: function(){
  //   collection = new app.SearchResults.Collection;
  //   collection.fetch({ data: $.param({userInput: $(".form-control").val() }) });
  //   debugger
  //   // this.model = new app.SearchResults.Model()
  // }
});




























// app.SearchResults.Models.SearchModel = Backbone.Model.extend({
//   initialize: function(data) {
//     this.data = data
//   }
// })

// app.SearchResults.Collections.SearchDirectory = Backbone.Collection.extend({
//   model: app.SearchResults.Models.SearchModel
// })

// app.SearchResults.Views.ApiResult = Backbone.View.extend({
    
//   ajaxResult: function(){
//     console.log("hi")
//     var input = $(".form-control").val()
//     var response = ""
//     Backbone.ajax({
//       // dataType: "json",
//       url: "/search",
//       type: "get",
//       data: {input: input}
//     }).done(function(data){
//       console.log("ajax success")
//       debugger
//       response = data
//       this.model = new app.SearchResults.Collections.SearchDirectory(data)
//     }.bind(this))
//     return this.model
//   },

//   render: function(){
//     this.ajaxResult()
//     debugger
//     var result = this.ajaxResult()
//     console.log("rendering")
//     debugger
//   }


  // template: _.template($('#search-template').html()),
  // render: function(data) {
  //   this.$el.html(this.template(this.data.toJSON()));
  //   return this
  // }


// })


// var AllResultsView = Backbone.View.extend({
//   el: $("#search-template"),

//   initialize: function(){
//     this.collection = new Directory(contacts);
//     this.render
//   },

//   render: function(){
//     var that = this;
//     _.each(this.collection)
//   }
// })



