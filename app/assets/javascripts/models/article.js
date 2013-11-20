Fews.Article = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string'),
  author: DS.attr(),
  createdAt: DS.attr('date'),
  votesCount: DS.attr('number'),


});
