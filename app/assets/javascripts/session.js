Fews.Session = Ember.Object.extend({
  token: null,
  userId: null,
  currentUser: null,
  votes: [],

  init: function () {
    this.restore();
  },

  isAuthenticated: function () {
    return this.get('token') && this.get('userId');
  }.property('token'),

  authenticate: function (userId, token) {
    this.set('token', token);
    this.set('userId', userId);
    this.ensureCurrentUser();

    this.syncCookie();

  },

  unauthenticate: function () {
    this.set('token', null);
    this.ensureCurrentUser();
    this.syncCookie();
  },

  ensureCurrentUser: function () {
    var  store = Fews.__container__.lookup('store:main');
    var session = this;
    if (this.get('isAuthenticated')) {
      store.find('user', this.get('userId')).then(function (user) {
        session.set('currentUser', user);
      });
    }
    session.set('currentUser', null);
  },


  rememberVote: function (article) {
    this.get("votes").push( article.get('id'));
    this.syncCookie();

  },

  syncCookie: function () {
    var token = this.get("token");
    $.cookie('votes', this.get('votes').uniq().join());

    if(token){
      $.cookie('token', this.get('token'));
      $.cookie('userId', this.get('userId'));
    } else {
      $.removeCookie('token');
      $.removeCookie('userId');
    }

  },

  restore: function () {
    var votes = $.cookie('votes') || '';
    this.setProperties({
      token: $.cookie('token'),
      userId: $.cookie('userId'),
      votes: votes.split(',')
    });
    this.ensureCurrentUser();
  },

});
