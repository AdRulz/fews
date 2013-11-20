// For more information see: http://emberjs.com/guides/routing/

Fews.ArticlesIndexRoute = Ember.Route.extend({
  redirect: function () {
    this.transitionTo('feed');
  },

});
