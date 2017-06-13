@myApp = angular.module('myApp', ['infinite-scroll' ])
myApp.controller 'DemoController', ($scope, Reddit) ->
  $scope.reddit = new Reddit
  return
# Reddit constructor function to encapsulate HTTP and pagination logic
myApp.factory 'Reddit', ($http, $sce) ->

  Reddit = ->
    @items = []
    @busy = false
    @after = ''
    return

  Reddit::nextPage = ->
    if @busy
      return
    @busy = true
    url = 'https://api.reddit.com/hot?after=' + @after + '&jsonp=JSON_CALLBACK'
    alert(url)
    $http.jsonp($sce.trustAsResourceUrl(url)).success ((data) ->
      items = data.data.children
      i = 0
      while i < items.length
        @items.push items[i].data
        i++
      @after = 't3_' + @items[@items.length - 1].id
      @busy = false
      return
    ).bind(this)
    return

  Reddit