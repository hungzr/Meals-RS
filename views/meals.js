/* Set the width of the sidebar to 250px (show it) */

function openNav() {
  document.getElementById("mySidenav").style.width = "30%";
  document.getElementById("main").style.marginLeft = "30%";
  document.getElementById("option-sign").style.marginLeft = "-22%";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.getElementById("option-sign").style.marginLeft= "auto";
  document.getElementById("option-sign").style.marginRight= "0";
  document.body.style.backgroundColor = "white";
}

// Rating Initialization
$(document).ready(function() {
  $('#rateMe4').mdbRate();
});


$(function () {
    $('.selectpicker').selectpicker();
});

// Animations initialization
new WOW().init();