'use strict'

angular.module 'SampleApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'accordian',
      url : "/accordian-main"
      views:
        acc_area:
          templateUrl : "sample-component/accordian-component/accordian-main.html"

  .state 'accordian.detail',
      url : "/detail"
      views:
        acc_area:
          templateUrl : "sample-component/accordian-component/accordian-detail.html"
          controller : "AccordianController"