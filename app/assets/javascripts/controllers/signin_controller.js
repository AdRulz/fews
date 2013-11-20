Fews.SigninController = Ember.Controller.extend({
  email: "",
  password: "",
  authError: false,
  url: 'api/v1/sessions.json',
  credentialsData: function () {
    return {
      email: this.get('email'),
      password: this.get('password')
    };
  }.property('email', 'password'),


  actions: {
    submit: function () {
      var controller = this;
      Ember.$.post(this.get('url'), this.get('credentialsData')).then(function(data) {
        controller.get('session').authenticate(data.session.token);
        controller.set('authError', false);
      }, function(data){
        controller.set('authError', true);
      });
    },
  }

});
