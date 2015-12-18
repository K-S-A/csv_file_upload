"use strict"

angular.module('csvTestApp').controller 'MainCtrl', [
  '$scope'
  '_'
  'mainFactory'
  '$log'
  ($scope, _, mainFactory, $log) ->
    vm = this
    vm.headers = mainFactory.headers
    vm.data = mainFactory.data
    vm.file = mainFactory.file

    $scope.csv = mainFactory.csv

    vm.analyzeCsv = ->
      mainFactory.setData()
      mainFactory.setFile()
      mainFactory.findErrors()

    vm.checkVisible = ->
      mainFactory.checkFile()

    vm

]
