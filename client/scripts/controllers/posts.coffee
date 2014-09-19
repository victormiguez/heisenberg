define ['app'], (app) ->
  app.controller 'PostsCtrl', [
    '$scope', '$http', '$location'
    ($scope, $http, $location) ->
      $scope.remove = (post) ->
        $http.delete("/api/post/#{post.id}")
          .success -> $location.path('/posts/list').search('action', 'excluído').search('registry', post.title)


      $scope.action = $location.search().action
      $scope.registry = $location.search().registry

      $http.get('/api/posts')
        .success (data) ->
          $scope.posts = data
  ]

  app.controller 'PostsAddCtrl', [
    '$scope', '$http', '$location'
    ($scope, $http, $location) ->
      $scope.submit = (isValid) ->
        $scope.isDisabled = true

        unless isValid
          $scope.isDisabled = false
          $scope.submitted = true
          return false

        $http.post('/api/post', $scope.post)
          .success -> $location.path('/posts/list').search('action', 'inserido').search('registry', $scope.post.title)
      return
  ]

  app.controller 'PostsEditCtrl', [
    '$scope', '$http', '$location', '$routeParams'
    ($scope, $http, $location, $routeParams) ->
      $http.get("/api/post/#{$routeParams.id}")
        .success (data) ->
          $scope.post = data
          return

      $scope.submit = (isValid) ->
        $scope.isDisabled = true
        $scope.submitted = true

        unless isValid
          $scope.isDisabled = false
          $scope.submitted = true
          return false      

        $http.put("/api/post/#{$routeParams.id}", $scope.post)
          .success (data) -> $location.path('/posts/list').search('action', 'editado').search('registry', $scope.post.title)
      return
  ]

  return