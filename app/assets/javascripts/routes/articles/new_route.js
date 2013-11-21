// For more information see: http://emberjs.com/guides/routing/

Fews.ArticlesNewRoute = Ember.Route.extend({

  beforeModel: function () {
    if (!this.get('session.isAuthenticated')) {
      this.transitionTo('signInFirst');
    }
  },

  model: function () {
    return this.get("store").createRecord('article');
  },

  actions: {
    willTransition: function (transition) {
      var model = this.get('currentModel');
      if(model.get('isNew')){
        model.deleteRecord();
      }
    },
  }

});
