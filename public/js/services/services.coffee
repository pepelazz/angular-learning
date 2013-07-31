
services = angular.module 'github.services', ['ngResource']

services.factory 'Recipe', ['$resource', ($resource)->
  $resource '/recipes/:id', {id: '@id'}
]

services.factory "MultiRecipeLoader", ["Recipe", "$q", (Recipe, $q) ->
  ->
    delay = $q.defer()
    Recipe.query ((recipes) ->
      delay.resolve recipes
    ), ->
      delay.reject "Unable to fetch recipes"

    delay.promise
]

services.factory "RecipeLoader", ["Recipe", "$route", "$q", (Recipe, $route, $q) ->
  ->
    delay = $q.defer()
    Recipe.get
      id: $route.current.params.recipeId
    , ((recipe) ->
      delay.resolve recipe
    ), ->
      delay.reject "Unable to fetch recipe " + $route.current.params.recipeId

    delay.promise
]