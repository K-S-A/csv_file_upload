"use strict"

angular.module('csvTestApp').directive 'showValidation', ->
    restrict: 'A'
    require: '^form'
    link: (scope, el, attrs, formCtrl) ->
      inputEl = el[0].querySelector("[name]")
      inputNgEl = angular.element(inputEl)
      inputName = inputNgEl.attr("name")
      inputNgEl.bind "blur keyup", ->
        el.toggleClass("has-error", formCtrl[inputName].$invalid).toggleClass "has-success", formCtrl[inputName].$valid
