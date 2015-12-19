"use strict"

angular.module('csvTestApp').controller 'MainCtrl', [
  '$scope'
  '$state'
  '_'
  'mainFactory'
  '$log'
  ($scope, $state, _, mainFactory, $log) ->
    vm = this
    vm.headers = mainFactory.headers
    vm.data = mainFactory.data
    vm.file = mainFactory.file
    vm.message = mainFactory.message

    $scope.csv = mainFactory.csv

    vm.analyzeCsv = ->
      vm.message = false
      mainFactory.setData()
      mainFactory.setFile()
      mainFactory.findErrors()


    vm.checkVisible = ->
      mainFactory.checkFile()

    vm.createRows = ->
      mainFactory.createRows().success ->
        vm.message = true

    vm

]
