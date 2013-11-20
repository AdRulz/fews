Fews.Router.reopen({
  location: 'history'
});

Fews.Router.map(function() {
  this.route('feed', { path: '/'});
  this.resource('articles', { path: '/articles'}, function () {
    this.route('new');
  });

  this.route('article', { path: '/article/:article_id'});
  this.resource('user', { path: '/user/:user_id' }, function () {
    this.route('index', { path: '/'});
  });

  this.route('signInFirst',{ path: 'sign-in-first' });

});
