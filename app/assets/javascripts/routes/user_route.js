Fews.UserRoute = Ember.Route.extend({

  actions: {
    error: function () {
      this.transitionTo('feed');
    },
  }

});
