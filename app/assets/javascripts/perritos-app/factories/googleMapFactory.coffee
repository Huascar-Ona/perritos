GoogleMapFactory  = ($http)->
  factory = {}
  factory.getCoordinates = (dogId)->
    return $http.get('/dogs/' + dogId + '/edit.json')

  factory

GoogleMapFactory.$inject = ['$http']

angular.module('perritosApp').factory('GoogleMapFactory', GoogleMapFactory)