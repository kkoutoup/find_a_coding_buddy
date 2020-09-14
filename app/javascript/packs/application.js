// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("channels")




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
require("trix")
require("@rails/actiontext")
require("bootstrap")
require("@rails/activestorage").start()
require("jquery")
// require("popper")
// require("tree")

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import "bootstrap";

import { highlightTechnology } from "./highlight_technologies.js"
import { initChatroomCable } from "../channels/chatroom_channel.js"
import { tns } from "../../../node_modules/tiny-slider/src/tiny-slider"


document.addEventListener('turbolinks:load', () => {
  highlightTechnology();
  initChatroomCable();

  const sessionFilterButtons = document.querySelector(".align-banner")
  if(sessionFilterButtons){
    const slider = tns({
      container: '.my-slider',
      loop: true,
      items: 1,
      slideBy: 'page',
      nav: false,
      // autoplay: true,
      // speed: 400,
      autoplayButtonOutput: false,
      mouseDrag: true,
      lazyload: true,
      controlsContainer: "#customize-controls",
      responsive: {
          640: {
              items: 2,
          },

          768: {
              items: 3,
          }
      }

    });
  }
});

const options = {
  show : true
}

$(document).ready(function(){
    $("#button-modal").click(function(){
        $("#exampleModalLong").modal(options);
    });
});

$(document).ready(function(){
    $("#button-save-changes").click(function(){
        console.log("test");
    });
});

