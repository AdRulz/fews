Fews.Article = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string'),
  email: DS.attr('string'),
  createdAt: DS.attr('date'),
  votesCount: DS.attr('number'),


});
