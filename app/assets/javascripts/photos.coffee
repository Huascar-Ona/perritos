# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@dropzoneLoad = ->
  dropzone = undefined
  dropzone = undefined
  Dropzone.autoDiscover = false
  dropzone = new Dropzone('.dropzone',
    maxFilesize: 3
    addRemoveLinks: true
    success: (file, response) ->
      $(file.previewTemplate).find('.dz-remove').attr 'id', response.fileID
      $(file.previewElement).addClass 'dz-success'
      return
    removedfile: (file) ->
      id = undefined
      id = $(file.previewTemplate).find('.dz-remove').attr('id')
      $.ajax
        type: 'DELETE'
        url: '/photos/' + id
        success: (data) ->
          console.log data.message
          $(file.previewTemplate).fadeOut()
          return
      return
)
  dropzone.on 'sending', (file, xhr, formData) ->
    formData.append 'photo[image]', file
    formData.append 'photo[dog_id]', $('#photo_dog_id').val()
    return
  return