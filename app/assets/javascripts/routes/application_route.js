Fews.ApplicationRoute = Ember.Route.extend({
  setupController: function () {
    if(this.get('session.isAuthenticated')){
      this.get('session').ensureCurrentUser();
    }
  },
});
