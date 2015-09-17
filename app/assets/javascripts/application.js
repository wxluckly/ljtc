// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require plugins/jquery.event.drag-1.5.min
//= require plugins/jquery.touchSlider
//= require plugins/jquery.validate
//= require plugins/jquery.validate.messages_zh
//= require plugins/placeholder
//= require plugins/banner
//= require plugins/slide
//= require plugins/icheck
//= require plugins/menu
//= require plugins/backtop

$( document ).on("click", "#like_travel", function() {
  $.ajax({
    url: "/ajax/like_travel",
    type: "POST",
    data: {id: $(this).data('id')},
    success: function(result) {
      $("#like_travel").hide();
      $("#liked_travel").show();
      var count = parseInt($("#liked_travel em").text());
      $("#liked_travel em").text(count + 1);
    }
  })
});