# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.uploadFile = (file) ->
  console.log file
  $.getJSON "/generate_signed_s3_url?filename=" + file.name.replace(RegExp(" ", "g"), "_") + "&content_type=" + file.type, (data) ->
    uploadToS3 file, data.put_url, data.content_type
    $("#homework_user_url").val data.file_url


window.setProgress = (progress, str) ->
  $(".progress .meter").css "width", progress + "%"
  $("#homework-user-upload-progress .text").text str
  $("#new_homework_user_submit").disabled = false  if progress is 100

$ ->
  $("#homework-user-upload-progress").hide()
  $("#new_homework_user_submit").disabled = true
  $("#new_homework_user_submit").click ->
    $("#homework_user_file").remove()
    true

  $("#homework_user_file").change (obj) ->
    file = undefined
    file = obj.target.files[0]
    if file.size > 500 * 1024 * 1024
      alert "File cannot be larger than 500MB."
      return false
    $("#homework-user-upload-progress").show()
    uploadFile file
