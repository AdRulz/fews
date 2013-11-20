Fews.SigninView = Ember.View.extend({
  templateName: 'signin',
  classNames: ["nav navbar-nav", "navbar-right"],

  click: function (e) {
    if (this.shouldKeepOpened(e.target)) {
      e.preventDefault();
      return false;
    }
  },

  hasEmailError: function () {
    var hasError, email = this.get('controller.email');
    if (this.get('controller.authError')) {
      hasError = !this.validateEmail(email);
    } else {
      hasError = false;
    }
    return hasError;
  }.property('controller.email', 'controller.authError'),

  hasPasswordError: function () {
    return this.get('controller.authError');
  }.property('controller.authError'),


  validateEmail: function(email) {
    var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\ ".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA -Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return pattern.test(email);
  },

  shouldKeepOpened: function (el) {
    var $el = $(el);
    return $el.data('prevent-close') || $el.parents('[data-prevent-close="true"]').length > 0;
  },


});
