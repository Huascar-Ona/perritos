@app = angular.module('myApp', [ 'uiGmapgoogle-maps', 'ngGeolocation','ngRoute'])
  .config ['$routeProvider','$httpProvider', 'uiGmapGoogleMapApiProvider', ($routeProvider, $httpProvider, uiGoogleMapApiProviders) ->
    
    uiGoogleMapApiProviders.configure {
      key: 'AIzaSyDJoQ_NXGdOXF8-NnWTtY_AD5IC3Y-Uyr4'
    }
    
    $routeProvider.
      when '/dogs/new', {templateUrl: '', controller: 'GoogleMapController', controllerAs: 'gMapsCtrl'}

    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

    return

  ]
  #Controllers
  .controller 'GoogleMapController', ['$geolocation', '$scope', ($geolocation, $scope) ->
    angular.extend $scope, map:  
      center:
        latitude: 0
        longitude: 0
      zoom: 13
      markers: null
      events: click: (map, eventName, originalEventArgs) ->
        e = originalEventArgs[0]
        lat = e.latLng.lat()
        lon = e.latLng.lng()
        marker =
          id: Date.now()
          coords:
            latitude:lat
            longitude: lon
        $scope.map.markers = marker
        $scope.UserMarker =
          { 
            currentLatitude:
              marker.coords.latitude
            currentLongitude:
              marker.coords.longitude
          }
        $scope.$apply()

    $geolocation.getCurrentPosition().then((position)-> 
      if !$scope.UserMarker 
        $scope.map.center.latitude = position.coords.latitude
        $scope.map.center.longitude = position.coords.longitude
        $scope.map.markers =
          {
            id:1
            coords: 
              latitude: position.coords.latitude
              longitude: position.coords.longitude
          }
      else
        $scope.map.markers =
        {
          #UserMarker.id is the id of the registered dog.
          id: $scope.UserMarker.id
          coords:
            latitude: $scope.UserMarker.currentLatitude
            longitude: $scope.UserMarker.currentLongitude
        }
      return
    )
    return
  ]