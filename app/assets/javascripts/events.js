$(document).ready(function(){
    $('.grid_box').bind('click', getAnchorId);
    
    /* Grabs the href from the div when clicked 
       and redirects to new page.*/
    function getAnchorId() {
      var anchorId = $(this).children('a').attr('href');
      window.location = anchorId;
    }
})