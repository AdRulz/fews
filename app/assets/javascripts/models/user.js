Fews.User = DS.Model.extend({
  email: DS.attr('string'),
  nickname: function () {
    return this.get('email').split('@')[0];
 }.property("email"),

});
