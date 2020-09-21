function navbarMenuToggle() {
  var toggle = $('.dropdown-toggle'),
      menu = $('.dropdown-menu');

  toggle.click(function(){
    var coordinatesTop = toggle.offset().top;
    var coordinatesLeft = toggle.offset().left;
    menu.css({ top: coordinatesTop + 35, left: coordinatesLeft - 130, right: 0, width: 80  })
  })
}

export { navbarMenuToggle };