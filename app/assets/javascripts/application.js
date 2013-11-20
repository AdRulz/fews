//= require jquery
//= require jquery_ujs
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require bootstrap
//= require moment
//= require_self
//= require fews

DS.ActiveModelAdapter.reopen({
    namespace: 'api/v1'
});

Fews = Ember.Application.create();

//= require_tree .
