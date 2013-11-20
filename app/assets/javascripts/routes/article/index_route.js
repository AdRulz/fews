// For more information see: http://emberjs.com/guides/routing/

Fews.ArticleIndexRoute = Ember.Route.extend({
  model: function () {
    return this.modelFor('article');
  }

});
