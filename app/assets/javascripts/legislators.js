var ready;
ready = function() {

  $(function(){
    $(".myTable").tablesorter();
  });

};

$(document).ready(ready);
$(document).on('page:load', ready)
