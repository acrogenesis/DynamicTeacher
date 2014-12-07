// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require foundation
//= require abracadabra
//= require datatables
//= require dataTables.foundation
//= require ace-builds/src/ace
//= require ace-builds/src/mode-csharp
//= require turbolinks
//= require_tree .

$(function(){
  $(document).foundation();
  $.abracadabra();
  $('table').dataTable({
    'language': {
      'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
    }
  });
  var editor;
  $('.editor').each(function( index ) {
    editor = ace.edit(this);
    editor.getSession().setMode('ace/mode/csharp');
    editor.setReadOnly(false);
  });
});
