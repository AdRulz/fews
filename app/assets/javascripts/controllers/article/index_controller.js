Fews.ArticleIndexController = Ember.ObjectController.extend({
  isVoted: function () {
    return this.get('session.votes').contains(this.get('model.id'));
  }.property('model.votesCount', 'session.votes.[]'),

  canEdit:function () {
    var currentUser = this.get('session.currentUser');
    var authorId = this.get('model.author.id');
    return currentUser && currentUser.get('id') == authorId;
  }.property('session.currentUser', 'model'),


});
