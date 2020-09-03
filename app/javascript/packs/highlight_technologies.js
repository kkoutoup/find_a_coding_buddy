function highlightTechnology(){
  $(document).ready(function(){
    $(".technology-choice").click(function(){
      $(this).toggleClass("active");
    })
  });
}

export {highlightTechnology};