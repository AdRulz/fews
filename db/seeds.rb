body = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
user = User.create({
  email: 'adil.jarulin@gmail.com',
  password: '1233321',
  password_confirmation: '1233321',
  token: 'megatoken',
})

another_user = User.create({
  email: 'user@example.com',
  password: '1233321',
  password_confirmation: '1233321',
  token: 'othertoken',
})

Article.create([
  { 
    title: 'Big Theme',
    body: body,
    user: user
  }, 
  { 
    title: 'Hot Theme', 
    body: body,
    user: user
  },
  { 
    title: 'Every Theme', 
    body: body,
    user: another_user
  },
  { 
    title: 'Heading', 
    body: body,
    user: another_user
  }
]);

