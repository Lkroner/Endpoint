ENDPOINT.Models.ApiProfile = Backbone.Model.extend({

  initialize: function(){
  },

  defaults: {
    "title": "",
    "description": "",
    "tips": "",
    "average_score": "",
    "logo_url": "",
    "data_type": "",
    "doc_link": "",
    "endpoint_link": "",
    "num_followers": 0,
  }
})