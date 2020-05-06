$(document).on('click', '.sign_up', function() {
  $( '.sign_up_form' ).fadeIn( 'slow' );
  $( '.yield' ).fadeIn( 'fast ');
  $(document).on('click', '#up-close', function() {
    $( '.sign_up_form' ).fadeOut( 'slow' );
    $( '.yield' ).fadeOut( 'fast ');
  });
  $(document).keydown(function(e) {
    if (e.keyCode === 27) {
      $( '.sign_up_form' ).fadeOut( 'slow' );
      $( '.yield' ).fadeOut( 'fast ');
    }
  $(document).on('click', '.to_signup', function () {
    $( '.sign_in_form' ).fadeOut( 'slow' );
    $( '.sign_up_form' ).fadeIn( 'slow' );
    $( '.yield' ).fadeIn( 'fast ');
  });    
  });
});

$(document).on('click', '.sign_in', function() {
  $( '.sign_in_form' ).fadeIn( 'slow' );
  $( '.yield' ).fadeIn( 'fast ');
  $(document).on('click', '#in-close', function() {
    $( '.sign_in_form' ).fadeOut( 'slow' );
    $( '.yield' ).fadeOut( 'fast ');
  });
  $(document).keydown(function(e) {
    if (e.keyCode === 27) {
      $( '.sign_in_form' ).fadeOut( 'slow' );
      $( '.yield' ).fadeOut( 'fast ');
    }
    $(document).on('click', '.to_login', function () {
      $( '.sign_up_form' ).fadeOut( 'slow' );
      $( '.sign_in_form' ).fadeIn( 'slow' );
      $( '.yield' ).fadeIn( 'fast ');
    });  
  });
});

$(document).on('click', '.to_login', function () {
  $( '.sign_up_form' ).fadeOut( 'slow' );
  $( '.sign_in_form' ).fadeIn( 'slow' );
  $( '.yield' ).fadeIn( 'fast ');
});