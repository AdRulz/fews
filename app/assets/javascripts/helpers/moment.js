Ember.Handlebars.registerBoundHelper('moment', function(value, options){
  var out;
  if(value){
    out = moment(value).format(options.hash.format);
  }
  return out;
});
