'use strict'

angular.module 'SampleApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'todo',
    url : "/todo-main"
    views:
      todo_area:
        templateUrl : "sample-component/todo-component/todo-main.html"

  .state 'todo.detail',
    url : "/detail"
    views:
      todo_area:
        templateUrl : "sample-component/todo-component/todo-detail.html"
        controller : "TodoController"