// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
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
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import "../plugins/flatpickr"

import { initStarRating } from '../plugins/init_star_rating';

// for confirmations
import { initSweetalert } from '../plugins/init_sweetalert';
// for cancellations
import { initSweetalertAll } from '../plugins/init_sweetalert_all';




document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initStarRating();
  initSweetalert('#sweet-alert-trainer', {
    title: "Congratulations!",
    text: "You're now a trainer",
    icon: "success"
  });
  initSweetalert('#sweet-alert-class', {
    title: "Congratulations!",
    text: "Your class has been created",
    icon: "success"
  });
  initSweetalertAll('#sweet-alert-booked', {
    title: "Congratulations!",
    text: "Your class has been booked",
    icon: "success"
  }, (value) => {
    console.log(value)
  if (value) {
    console.log(value,"hello");
    const id = value.classList[0].split("-")[3]
    console.log(id)
    const link = document.getElementsByClassName(id);
    console.log(link)
    link[0].click();
  }
});
  initSweetalert('#sweet-alert-subscription', {
    title: "Congratulations!",
    text: "Your membership has been upgraded",
    icon: "success"
  });



  initSweetalertAll('#sweet-alert-delete',{
   text: "You're about to cancel your booking. Are you sure?",
   icon: 'warning',
   buttons: true,
   dangerMode: true,
 }, (value) => {
  if (value) {
    console.log(value,"hello");
    const link = document.querySelector('#delete-link');
    link.click();
  }
});

});



