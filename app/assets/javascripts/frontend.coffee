app = angular.module('perritosApp', ['ngRoute','uiGmapgoogle-maps', 'ngGeolocation', 'infinite-scroll'])
  .config ['$routeProvider', '$httpProvider','$qProvider', ($routeProvider, $httpProvider, $qProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    $routeProvider
      .when('/dogs/:id/edit' ,{
        controller: 'GoogleMapController'
        templateUrl: ''
      # resolve: 
      #   aladdin: 
      #     ['GoogleMapFactory', (GoogleMapFactory)->
      #             return GoogleMapFactory.getCoordinates($scope.dog_id)]
      })
    # $qProvider.errorOnUnhandledRejections(false)
]