Fews.Article = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string'),
  author: DS.attr(),
  createdAt: DS.attr('string'),
  votesCount: DS.attr('number'),
  createdAtTimestamp: function () {
    return moment(this.get('createdAt')).format('X');
  }.property('createdAt'),

  authorMailTo: function () {
    var email = this.get('author.email');
    if (email) {
      return "mailto:" + email;
    }
  }.property("author")

});
