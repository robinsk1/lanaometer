 $(document).ready(function() {
    var eT=0;
    $('.tweet').hide().each(function() {
        $(this).delay(eT).fadeIn('slow');
        eT += 1200;
    });
  });