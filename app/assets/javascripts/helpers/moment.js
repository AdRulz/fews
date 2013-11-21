Ember.Handlebars.registerBoundHelper('moment', function(value, options){
  var out;
  if(value){
    out = moment.parseZone(value).format(options.hash.format);
  }
  return out;
});
