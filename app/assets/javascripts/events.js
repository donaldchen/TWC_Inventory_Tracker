$(document).ready(function(){
    // $('.grid_box').unbind('click', getAnchorId);
    // $('.btns').unbind('click', getAnchorId);
     $('.grid_box').bind('click', getAnchorId);
     $('.btns').bind('click', getAnchorId);

    // /* Grabs the href from the div when clicked 
    //    and redirects to new page.*/
     function getAnchorId() {
      var anchorId = $(this).children('a').attr('href');
      window.location = anchorId;
    //   return false;
     }

    // $('.grid_box').unbind('click', getAnchorId);


    


})