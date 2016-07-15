console.log "dddddddddddd"
angular.module("SampleApp", [
  "ngResource"
  "restangular"
  "ui.bootstrap"
  "ui.router"
  "pascalprecht.translate"
  "nvd3ChartDirectives"
]).run ($rootScope, Restangular, $state, $stateParams) ->
  
  # adds some basic utilities to the $rootScope for debugging purposes
  $rootScope.log = (thing) ->
    console.log thing

  $rootScope.alert = (thing) ->
    alert thing

  # To change the class on the navbar, need these variables available on root
  # scope
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams

# NOTE: URLS are of the form http://localhost:8000/#/something
.config ($stateProvider, $urlRouterProvider,$translateProvider, RestangularProvider) ->
  # TODO: At some point, configure translationProvider and test.
  # For any unmatched url, send to /route1
  $stateProvider
    .state("otherwise", { url : '/index'})
  $urlRouterProvider.otherwise "/index"
  return