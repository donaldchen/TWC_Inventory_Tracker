$(document).ready(function(){
    $('.grid_box').bind('click', getAnchorId);
    
    /* Grabs the href from the div when clicked 
       and redirects to new page.*/
    function getAnchorId() {
      var anchorId = $(this).children('a').attr('href');
      window.location = anchorId;
    }
    
    $('.btns').bind('click', getAnchorId);
    
    /* Grabs the href from the div when clicked 
       and redirects to new page.*/
    function getAnchorId() {
      var anchorId = $(this).children('a').attr('href');
      window.location = anchorId;
    }
    
    // $('#add_item').bind('click', pop_up_page);

    // function pop_up_page(){
    //     var puw = $('.pop_up').css('visibility');
    //     if($(window).width() >= 768 && puw == "hidden"){
    //         $('.pop_up').css("visibility", "visible")
    //         $('.overlay').show();
    //         return false;
    //     }
    // }
    

    // $('#modal_values').submit(function(){
    //     var dataSet = $(this).serialize();
    //     $.ajax({
    //         type: 'POST',
    //         url: $(this).attr("action"),
    //         data: dataSet,
    //         success: function(data){
    //             alert('data is: ' + data);
    //             $('#result').html(data);
    //         }
    //     });
    //     e.preventDefault();
    //     return false;
    // });

})