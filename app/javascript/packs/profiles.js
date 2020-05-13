$(document).on('click', '#edit', function() {
  $( '.profile ').hide( 'fast' );
  $( '.edit_profile' ).show( 'fast' );
  $( '#edit' ).text("Discard");
  $(document).on('click', '#edit', function() {
    window.location.reload();
  });
});

$(document).on('click', '#message', function() {
  $( '.message_box' ).fadeIn( 'fast' );
  $(document).on('click', '#up-close', function() {
    $( '.message_box' ).fadeOut( 'slow' );
    $( '.yield' ).fadeOut( 'fast ');
  });

  $(document).keydown(function(e) {
    if (e.keyCode === 27) {
      $( '.message_box' ).fadeOut( 'slow' );
      $( '.yield' ).fadeOut( 'fast ');
    }   
  });

});