define [], ->
  defaultRoutePath: '/'
  routes:
    '/':
      templateUrl: '../views/home/index.html'
      dependencies: ['controllers/home']

    '/posts/list':
      templateUrl: '../views/posts/list.html'
      dependencies: ['controllers/posts']

    '/posts/add':
      templateUrl: '../views/posts/add.html'
      dependencies: ['controllers/posts', 'directives/post-form']

    '/posts/edit/:id':
      templateUrl: '../views/posts/edit.html'
      dependencies: ['controllers/posts', 'directives/post-form']

    '/posts/delete/:id':
      dependencies: ['controllers/posts']