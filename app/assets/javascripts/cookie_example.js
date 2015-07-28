//When the user submits their name, set a cookie with that value
//Then, when they revisit the page, display their name in
//the greeting div
//
//If the user has not visited the page before, display
//an animation, otherwise do not display the animation.

function setUserNameCookie() {
  var usersName = $('#nameTheUserTypes').val()
  Cookies.set('name', usersName);
}

function onAnimationComplete() {
  $('#greeting').empty();
}

function setupFormListener() {
  $('#cookie-name').on('submit', setUserNameCookie);
}

function animateForFirstTimeVisitor(){
  if (Cookies.get('skipAnimation') !== 'true') {
    $('#greeting').text('Welcome!');
    $('#greeting').animate({'font-size': '84px'}, 3000, onAnimationComplete);
  }
}

function markUserAsHavingVisitedPage() {
  Cookies.set('skipAnimation', true)
}

function showNameIfInCookie(){
  if (Cookies.get('name')) {
    var name = Cookies.get('name');
    $('#greeting').html(name);
  }
}

$(document).ready(function() {
  setupFormListener();
  animateForFirstTimeVisitor();
  markUserAsHavingVisitedPage();
  showNameIfInCookie();
});

