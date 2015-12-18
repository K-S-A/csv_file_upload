'use strict'

angular.module('csvTestApp', [
  'ui.bootstrap'
  'ui.router'
  'templates'
  'underscore'
  'Devise'
  'ngCsvImport'
]).config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state('home',
        url: '/'
        templateUrl: 'home/home.html'
        controller: 'MainCtrl as vm')
      .state('login',
        url: '/login'
        templateUrl: 'auth/_login.html'
        controller: 'AuthCtrl as vm'
        onEnter: [
          '$state'
          'Auth'
          ($state, Auth) ->
            Auth.currentUser().then ->
              $state.go 'home'])
      .state('register',
        url: '/register'
        templateUrl: 'auth/_register.html'
        controller: 'AuthCtrl as vm'
        onEnter: [
          '$state'
          'Auth'
          ($state, Auth) ->
            Auth.currentUser().then ->
              $state.go 'home'])

    $urlRouterProvider.otherwise 'login'

]
