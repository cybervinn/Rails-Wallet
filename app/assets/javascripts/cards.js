
$(document).ready(function() {

  var counter = 0;

  //happens once, after a 1000ms delay
  //setTimeout(function(){ console.log('hey' }, 1000);

  //happens every 1000
  setInterval(function() {
    console.log(counter);
    counter++;
  }, 1000);


  $('#card_number').on('keyup', function() {

    //get the first number the user entered in the form
    var firstDigit = $('#card_number').val()[0]

    //if it is not 3, 4, or 5, empty the div & show an error msg
    if (!(firstDigit == '3' || firstDigit == '4' || firstDigit == '5')){
      $('#card_number').empty();
      $('#client-side-error').text('Invalid first number');
    }
  });

  // if this were uncommented, clicking the form submit
  // button would do nothing, because we intercept the 'submit'
  // event and return false, which effectively cancels it
  //
  //$('#new_card').on('submit', function() {
    //return false
  //});

  $('#first').on('click', function(e){
    alert('red square was clicked');
  });

  $('#second').on('click', function(e){

    $('#first').trigger({type: 'alertElapsed',
                         elapsed: counter});

    //this will stop the 'click' event from propagating
    //upwards through all containing elements
    e.stopPropagation();
  });


  $('#first').on('alertElapsed', function(e) {
    console.log(e);
    $('#first').text(e.elapsed);
  });

  //////// SECOND EXAMPLE ////////

  var greenSquareTime = 0;
  var greenSquareTimer;

  function incGreenSquareTime(){
    greenSquareTime++;
    $('#green-square-timer').text(greenSquareTime);
  }

  $('#green-square').on('mouseenter', function(){
    greenSquareTimer = setInterval(incGreenSquareTime, 1000);
  });

  $('#green-square').on('mouseleave', function(){
    greenSquareTime = 0;
    clearInterval(greenSquareTimer);
    $('#green-square-timer').text(greenSquareTime);
  });

});
