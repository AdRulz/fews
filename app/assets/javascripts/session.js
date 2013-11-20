Fews.Session = Ember.Object.extend({
  token: null,
  userId: null,
  currentUser: null,

  init: function () {
    this.restore();
  },


  isAuthenticated: function () {
    return this.get('token');
  }.property('token'),


  authenticate: function (userId, token) {
    this.set('userId', userId);
    this.set('token', token);
    this.syncCookie();

    this.ensureCurrentUser();
  },

  unauthenticate: function () {
    this.setProperties({
      token: null,
      currentUser: null,
    });
    this.syncCookie();
  },

  ensureCurrentUser: function () {
    var router = Fews.__container__.lookup('router:main');
    router.transitionTo('user', this.get('userId'));
  },

  syncCookie: function () {
    var token = this.get("token");
    if(token){
      $.cookie('token', this.get('token'));
      $.cookie('userId', this.get('userId'));
    } else {
      $.removeCookie('token');
      $.removeCookie('userId');
    }

  },

  restore: function () {
    this.set('token', $.cookie('token'));
    this.set('userId', $.cookie('userId'));
  },

});
