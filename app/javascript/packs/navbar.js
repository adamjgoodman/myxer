$(document).on('click', '#sign_up', function() {
  $( '.sign_up_form' ).fadeIn( 'slow' );
  $( '.yield' ).fadeIn( 'fast ');
  $(document).on('click', '.fa-window-close', function() {
    $( '.sign_up_form' ).fadeOut( 'slow' );
    $( '.yield' ).fadeOut( 'fast ');
  });
});