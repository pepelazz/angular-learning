
directives = angular.module 'github.directives', []

directives.directive 'butterbar', ['$rootScope', ($rootScope)->
  link: (scope, element, attrs)->
    element.addClass 'hide'
    $rootScope.$on '$routeChangeStart', ->
      element.removeClass 'hide'
    $rootScope.$on '$routeChangeSuccess', ->
      element.addClass 'hide'
    return
]

directives.directive 'focus', ->
  link: (scope, element, attrs)->
    element[0].focus()