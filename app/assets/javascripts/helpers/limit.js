Ember.Handlebars.registerBoundHelper('limit', function (value, options) {
  var limit = options.hash.to || 35;
  var out = value;
  if (value && value.length > limit){
    out = value.substr(0,limit);
    out = out + '…';
  }
  return out;

});

