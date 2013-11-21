// for more details see: http://emberjs.com/guides/controllers/

Fews.ArticlesNewController = Ember.ObjectController.extend({

  actions: {
    submit: function () {
      var controller = this;
      var user = controller.get('session.currentUser');
      this.get('model').save().then(function (model) {
        controller.transitionToRoute('article', model);
        user.reload();
      });

    },
    cancel: function () {
      this.get('model').deleteRecord();
      this.transitionToRoute('feed');
    },
  }

});
