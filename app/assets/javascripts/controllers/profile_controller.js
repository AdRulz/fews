Fews.ProfileController = Ember.Controller.extend({

  actions: {
    signout: function () {
      this.get('session').unauthenticate();
      this.transitionToRoute('feed');
    },
  }

});
