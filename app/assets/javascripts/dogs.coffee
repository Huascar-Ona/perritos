# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@initDogs = ->
  $('#dogInfo').tabs()
  return
@initDogsForm =->
  $('#dog_age').spinner
    min: 1,
    max: 30,
    classes: 
      "ui-spinner":'form-control'
  return
