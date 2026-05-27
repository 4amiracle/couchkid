document.addEventListener("DOMContentLoaded", function () {
  var overlay = document.getElementById("click-overlay");
  var title = document.getElementById("title");
  var logo = document.getElementById("logo");
  var navHome = document.getElementById("nav-home");
  var navStory = document.getElementById("nav-story");
  var merch = document.getElementById("main-merch");
  var cornerEmotions = document.getElementById("corner-emotions");
  var cornerMission = document.getElementById("corner-mission");

  // Hide overlay immediately and start animations on load
  overlay.style.display = "none";

  title.classList.add("animate-in");

  setTimeout(function () {
    merch.classList.add("animate-in");
  }, 600);

  setTimeout(function () {
    logo.classList.add("animate-in");
  }, 900);

  setTimeout(function () {
    navHome.classList.add("animate-in");
  }, 1400);

  setTimeout(function () {
    navStory.classList.add("animate-in");
  }, 1500);

  setTimeout(function () {
    cornerEmotions.classList.add("animate-in");
  }, 1600);

  setTimeout(function () {
    cornerMission.classList.add("animate-in");
  }, 1700);
});
