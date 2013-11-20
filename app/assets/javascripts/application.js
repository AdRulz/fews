//= require jquery
//= require jquery_ujs
//= require jquery
//= require jquery.cookie
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

$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
  var session = Fews.__container__.lookup('session:main');
  var token = session.get('token');
  jqXHR.setRequestHeader('X-Auth-Token', token);

});

//= require_tree .
