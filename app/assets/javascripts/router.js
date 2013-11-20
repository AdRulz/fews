Fews.Router.reopen({
  location: 'history'
});

Fews.Router.map(function() {
  this.route('feed', { path: '/'});
  this.resource('articles', { path: '/articles'}, function () {
    this.route('new');
  });
  this.resource('article', { path: '/article/:article_id'}, function(){
    this.route('edit');
  });
  this.resource('user', { path: '/user/:user_id' }, function () {
    this.route('index', { path: '/'});
  });

  this.route('signInFirst',{ path: '/sign-in-first' });
  this.route('notFound',{ path: '/404' });

});
