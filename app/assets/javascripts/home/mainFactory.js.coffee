"use strict"

angular.module('csvTestApp').factory 'mainFactory', [
  '_'
  '$http'
  '$log'
  '$filter'
  (_, $http, $log, $filter) ->
    o =
      csv:
        content: null
        header: !0
        headerVisible: !0
        separator: ','
        separatorVisible: 0
        result: null
        encoding: 'ISO-8859-1'
        encodingVisible: 0
      headers:
        ['Col1', 'Col2', 'Col3', 'Col4', 'Col5', 'Col6', 'Col7']
      csvHeaders: []
      data: []
      file:
        name: ''
        fullname: ''

    o.setFile =->
      o.file.name = $filter('fileName')(o.csv.result.filename)
      o.file.fullname = o.csv.result.filename

    o.checkFile = ->
      o.data.length && o.csv.result.filename == o.file.fullname

    o.setData = ->
      angular.copy(o.formatCsvData(), o.data)

    o.formatCsvData = ->
      _.map(_.values(o.csv.result)[0..-2], (val) ->
        _.mapObject(val, (v, k) ->
          v.replace(/(^"|"$)/g, '')))

    o
]
