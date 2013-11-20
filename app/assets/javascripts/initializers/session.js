//= require ./session

Fews.initializer({
  name: 'session',
  initialize: function (container, application) {
    container.optionsForType('session', { instantiate: true, singleton: true });
    container.register('session:main', Fews.Session);

    container.typeInjection('controller', 'session', 'session:main');
    container.typeInjection('route', 'session', 'session:main');
  },

});

