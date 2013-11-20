Fews.FeedRoute = Ember.Route.extend({

  model: function () {
    return this.get('store').findAll('article');
  },

});
