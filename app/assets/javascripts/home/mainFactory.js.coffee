"use strict"

angular.module('csvTestApp').factory 'mainFactory', [
  '_'
  '$http'
  '$filter'
  '$log'
  (_, $http, $filter, $log) ->
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
        ['col1', 'col2', 'col3', 'col4', 'col5', 'col6', 'col7']
      data: []
      file:
        name: ''
        fullname: ''
        errors: 0

    o.setFile =->
      o.file.name = $filter('fileName')(o.csv.result.filename)
      o.file.fullname = o.csv.result.filename

    o.checkFile = ->
      (o.file.errors || o.data.length) && o.csv.result.filename == o.file.fullname

    o.setData = ->
      angular.copy(o.formatCsvData(), o.data)

    o.formatCsvData = ->
      data = _.map(_.values(o.csv.result)[0..-2], (val) ->
        _.map(_.values(val), (v) ->
          v.replace(/(^"|"$)/g, '')))
      _.filter(data, (val) ->
          val.length is 7)

    o.findErrors = ->
      o.file.errors = o.csv.content.split('\n').length - o.data.length - (if o.csv.header then 2 else 1)

    o
]
