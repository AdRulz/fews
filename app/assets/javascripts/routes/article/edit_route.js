// For more information see: http://emberjs.com/guides/routing/

Fews.ArticleEditRoute = Ember.Route.extend({
  model: function () {
    return this.modelFor('article');
  }
});
