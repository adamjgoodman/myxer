$(document).on('click', '#new_message', function() {
  $( '.new_message_box' ).fadeIn( 'fast' );
  $(document).on('click', '#up-close', function() {
    $( '.new_message_box' ).fadeOut( 'slow' );
    $( '.yield' ).fadeOut( 'fast ');
  });

  $(document).keydown(function(e) {
    if (e.keyCode === 27) {
      $( '.new_message_box' ).fadeOut( 'slow' );
      $( '.yield' ).fadeOut( 'fast ');
    }   
  });

});