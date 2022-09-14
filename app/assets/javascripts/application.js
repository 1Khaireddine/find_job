//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require_tree

$(document).ready(function () {
  setTimeout(() => {
    $(".notice").remove()
    $(".alert").remove()
  }, 3000);
})