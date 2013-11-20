// for more details see: http://emberjs.com/guides/controllers/

Fews.ArticlesNewController = Ember.ObjectController.extend({

  actions: {
    submit: function () {
      var controller = this;
      this.get('model').save().then(function (model) {
        controller.transitionToRoute('article', model);
      });

    },
    cancel: function () {
      this.get('model').deleteRecord();
      this.transitionToRoute('feed');
    },
  }

});
