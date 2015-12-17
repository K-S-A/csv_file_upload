'use strict'

angular.module('csvTestApp').controller 'NavCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->
    vm = this

    vm.signedIn = Auth.isAuthenticated
    vm.user = Auth.currentUser()

    vm.logout = ->
      Auth.logout()

    $scope.$on 'devise:new-registration', (e, user) ->
      vm.user = user

    $scope.$on 'devise:login', (e, user) ->
      vm.user = user

    $scope.$on 'devise:logout', (e, user) ->
      vm.user = null
      $state.go 'login'

    vm

]
