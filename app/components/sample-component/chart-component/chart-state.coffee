'use strict'

angular.module 'SampleApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'chart',
      url : '/chart'
      views:
        chart_area:
          templateUrl : "sample-component/chart-component/chart-main.html"
          controller : "ChartController"