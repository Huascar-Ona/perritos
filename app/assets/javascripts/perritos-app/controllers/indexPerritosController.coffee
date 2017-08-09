IndexPerritosController = ($scope, pagination)->
  $scope.paginationPerritos = new pagination()

IndexPerritosController.$inject = ['$scope'
                                   'pagination' 
                                  ]
angular.module('perritosApp')
  .controller 'IndexPerritosController', IndexPerritosController