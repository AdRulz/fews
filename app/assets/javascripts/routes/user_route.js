Fews.UserRoute = Ember.Route.extend({

  model: function (params) {
    return this.get('store').find('user', params.user_id);
  },

  setupController: function (controller, model){
    this.get('session').set('currentUser', model);
  },


  renderTemplate: function () {
    return;
  },

  actions: {
    error: function () {
      this.get('session').unauthenticate();
    },
  }

});
