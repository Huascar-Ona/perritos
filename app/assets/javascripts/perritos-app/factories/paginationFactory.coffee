paginationFactory = ($http)->

  pagination = ->
    @items = [1,2,3,4,5,6,7,8]
    @busy = false
    @after = ''
    return

  pagination::nextPage = ->
    @last = @items.length
    i = 1
    while i <= 8
      @items.push @last + i
      i++
    @items

  pagination

paginationFactory.$inject = ['$http']

angular.module('perritosApp')
  .factory 'pagination', paginationFactory

# myApp.factory('Reddit', function($http) {
#   var Reddit = function() {
#     this.items = [];
#     this.busy = false;
#     this.after = '';
#   };

#   Reddit.prototype.nextPage = function() {
#     if (this.busy) return;
#     this.busy = true;

#     var url = "";
#     $http.jsonp(url).success(function(data) {
#       var items = data.data.children;
#       for (var i = 0; i < items.length; i++) {
#         this.items.push(items[i].data);
#       }
#       this.after = "t3_" + this.items[this.items.length - 1].id;
#       this.busy = false;
#     }.bind(this));
#   };

#   return Reddit;
# });