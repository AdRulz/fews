Fews.User = DS.Model.extend({
  email: DS.attr('string'),
  articles: DS.hasMany('article', {async: true}),
  nickname: function () {
    return this.get('email').split('@')[0];
 }.property("email"),

});
