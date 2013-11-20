Fews.Session = Ember.Object.extend({
  token: null,

  isAuthenticated: function () {
    return this.get('token');
  }.property('token'),


  authenticate: function (token) {
    this.set('token', token);
  },

  unauthenticate: function () {
    this.set('token', null);
  },

});
