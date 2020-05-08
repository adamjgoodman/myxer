$(document).on('click', '#edit', function() {
  $( '.profile ').hide( 'fast' );
  $( '.edit_profile' ).show( 'fast' );
  $( '#edit' ).text("Discard");
  $(document).on('click', '#edit', function() {
    window.location.reload();
  });
});