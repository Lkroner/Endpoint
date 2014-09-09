ENDPOINT.Models.Review = Backbone.Model.extend({
  initialize: function(){
  },

  defaults: {
    "score": "",
    "content": "",
    "title": "",
    "created_at": "",
    "user_id": "",
    "user_photo_url": "",
    "comment_content": ""
  }

})