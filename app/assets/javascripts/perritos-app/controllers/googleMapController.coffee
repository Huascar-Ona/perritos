GoogleMapController = ($geolocation, $scope, $log) ->
  angular.extend $scope, map:  
    center:
      latitude: 0
      longitude:  0
    zoom: 15
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
      return
  # $geolocation.getCurrentPosition().then((position)-> 
  #   $scope.myPosition = position
  #   # GoogleMapFactory.getCoordinates($scope.dog_id).then (response)->
  #   #     $scope.dog = response
  #   #   .error (data,status,headers,config)-> 
  #   #     $log.log(data.error + ' ' + status)
        
  #   if !$scope.UserMarker
  #     $scope.map.center.latitude = position.coords.latitude
  #     $scope.map.center.longitude = position.coords.longitude
  #     $scope.map.markers =
  #       {
  #         id:1
  #         coords: 
  #           latitude: position.coords.latitude
  #           longitude: position.coords.longitude
  #       }
  #     return
  #   else
  #     #UserMarker.id is the id of the registered dog.
  #     # $scope.map.center.latitude = $scope.dog.data.latitude
  #     # $scope.map.center.longitude = $scope.dog.data.longitude
  #     $scope.map.markers =
  #       {
  #         id: Date.now()
  #         coords:
  #           # latitude: $scope.dog.data.latitude
  #           # longitude: $scope.dog.data.longitude
  #           latitude: 20
  #           longitude: 89
  #       }
  #   return
  # )
  # return  

GoogleMapController.$inject = ['$geolocation'
                               '$scope'
                               '$log'
                              ]

angular.module('perritosApp')
  .controller 'GoogleMapController', GoogleMapController