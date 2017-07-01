$(document).ready(function(){
  $(".percent-change").each(function(){
    if ($(this).text().includes("-")) {
      $(this).css({"color": "red"})
    } else {
      $(this).css({"color": "green"})
    }
  })
})
