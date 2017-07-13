$(document).on("ready", function(){
  $("#new-portfolio-button").on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr('action'),
      method: $(event.target).attr('method'),
    }).success(function(response){
      $(event.target).append(response)
    })
  })
})
