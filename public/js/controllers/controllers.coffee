app = angular.module 'github',['github.directives','github.services']

app.config ['$routeProvider', '$locationProvider',($routeProvider, $locationProvider)->
  $routeProvider.
  when('/',{
    controller: 'ListCtrl',
    resolve: {
      recipes: (MultiRecipeLoader)->
        MultiRecipeLoader()
    },
    templateUrl: '/public/tmpl/list.html'
  }).
  when('/edit/:recipeId',{
    controller:'EditCtrl',
    resolve: {
      recipe: (RecipeLoader)->
        RecipeLoader()
    },
    templateUrl: '/public/tmpl/recipeForm.html'
  }).
  when('/view/:recipeId',{
    controller:'ViewCtrl',
    resolve: {
      recipe: (RecipeLoader)->
        RecipeLoader()
    },
    templateUrl: '/public/tmpl/viewRecipe.html'
  }).
  when('/new',{
    controller:'NewCtrl',
    templateUrl: '/public/tmpl/recipeForm.html'
  }).
  otherwise({
  redirectTo: '/'
  })
#  $locationProvider.html5Mode true
  return
]





app.controller 'ListCtrl', ['$scope', 'recipes', ($scope, recipes)->
  $scope.recipes = recipes
]

app.controller 'ViewCtrl', ['$scope', '$location', 'recipe', ($scope, $location, recipe)->
  $scope.recipe = recipe
  $scope.edit = ->
    $location.path '/edit/'+recipe.id
  return
]

app.controller 'EditCtrl', ['$scope', '$location', 'recipe', ($scope, $location, recipe)->
  $scope.recipe = recipe
  $scope.save =->
    $scope.recipe.$save (recipe)->
      $location.path '/view/'+recipe.id

  $scope.remove =->
    delete $scope.recipe
    $location.path '/'
    return

  return
]

app.controller 'NewCtrl', ['$scope', '$location', 'Recipe', ($scope, $location, Recipe)->
  $scope.recipe = new Recipe(ingredients: [{}])
  $scope.save =->
    $scope.recipe.$save (recipe)->
      $location.path '/view/'+recipe.id
  return
]

app.controller 'IngridientsCtrl', ['$scope', ($scope)->
  $scope.addIngridient =->
    ingredients = $scope.recipe.ingredients
    ingredients[ingredients.length]={}
    return
  $scope.removeIngridient =(index)->
    $scope.recipe.ingredients.splice index, 1
  return
]

