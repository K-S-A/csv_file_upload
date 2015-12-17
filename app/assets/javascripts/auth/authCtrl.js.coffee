'use strict'

angular.module('csvTestApp').controller 'AuthCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->
    vm = this

    vm.user = {}
    vm.email_regexp = /^([a-z0-9]+@[a-z]+\.[a-z]{2,5})$/

    vm.login = ->
      Auth.login(vm.user).then ->
        $state.go 'home'

    vm.register = ->
      Auth.register(vm.user).then ->
        $state.go 'home'

    vm

]
