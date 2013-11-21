Fews.ApplicationRoute = Ember.Route.extend({

  actions: {
    voteArticle: function (article) {
      var url ='/api/v1/articles/' + article.get('id') + '/vote.json';
      var session = this.get('session');
      Ember.$.post(url).then(function(data) {
        session.rememberVote(article);
        article.reload();
      });
    },
  }
});
