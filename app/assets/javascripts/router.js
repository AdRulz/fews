Fews.Router.reopen({
  location: 'history'
});

Fews.Router.map(function() {
   this.route('feed', { path: '/'});
   this.route('article', { path: '/article/:article_id'});
   this.resource('user', { path: '/user/:user_id' }, function () {
     this.route('index', { path: '/'});

     // create art
     // edit + delete art

     
   });
});
