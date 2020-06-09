/* Set the width of the sidebar to 250px (show it) */

function openNav() {
  document.getElementById("mySidenav").style.width = "30%";
  document.getElementById("main").style.marginLeft = "30%";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.body.style.backgroundColor = "white";
}

