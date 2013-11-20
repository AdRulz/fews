Fews.Router.reopen({
  location: 'history'
});

Fews.Router.map(function() {
   this.route('feed', { path: '/'});
   this.route('article', { path: '/article/:article_id'});
});
