@myApp = angular.module('myApp', [ 'uiGmapgoogle-maps' ])
.controller('GoogleCtrl', ['$scope',  ($scope) ->
  latitud = 20.968159
  longitud = -89.629119

  $scope.marker =
    id: 0
    coords:
      latitude: latitud
      longitude: longitud
    
  $scope.marker.options =
    draggable: true
    labelContent: "Hola"
    labelAnchor: '100 0'
    labelClass: 'marker-labels'
  
  $scope.map =
    center:
      latitude: latitud, 
      longitude: longitud 
    zoom: 15
  return
])