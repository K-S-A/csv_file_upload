'use strict'

angular.module('csvTestApp').filter 'fileName', ->
  (fullname)->
    fullname.split('.')[0]
