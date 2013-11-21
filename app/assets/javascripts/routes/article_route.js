Fews.ArticleRoute = Ember.Route.extend({

  actions: {
    error: function () {
      this.transitionTo('notFound');
    },

    save: function () {
      var route = this;
      this.get('currentModel').save().then(function (model) {
        route.transitionTo('article', model);
      });

    },

    cancel: function () {
      this.get('currentModel').rollback();
      this.transitionTo('article', this.get('currentModel'));
    },

    delete: function () {
      var route = this;
      this.get('currentModel').deleteRecord()
      this.get('currentModel').save().then(function (model) {
        route.transitionTo('feed');
      });
    },
  }

});
