Fews.ArticleController = Ember.ObjectController.extend({

  canEdit:function () {
    var currentUser = this.get('session.currentUser');
    var authorId = this.get('model.author.id');
    return currentUser && currentUser.get('id') == authorId;
  }.property('session.currentUser', 'model'),


});
