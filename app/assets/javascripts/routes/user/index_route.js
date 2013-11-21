
Fews.UserIndexRoute = Ember.Route.extend({
  model: function () {
    return this.modelFor('user');
  },

  setupController: function (controller, model) {
    this._super(controller, model);
    this.controllerFor('application').set('pageHeader', 'MY');
  },

  actions: {
    willTransition: function (transition) {
    this.controllerFor('application').set('pageHeader', null);
    },
  }
  

});
