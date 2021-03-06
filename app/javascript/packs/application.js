// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("plugins/local-time");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context("../images", true);
// const imagePath = (name) => images(name, true);

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import LocalTime from "local-time";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import "../plugins/flatpickr";
// import "../components/sidebar.js";
import LocalTime from "../plugins/local-time";
LocalTime.start();

import { previewImageOnFileSelect } from "../components/photo_preview";
import { initStarRating } from "../plugins/init_star_rating";
import { init_popover } from "../components/popover";

// for confirmations
// import { initSweetalert } from "../plugins/init_sweetalert";
// for cancellations
// import { initSweetalertAll } from "../plugins/init_sweetalert_all";

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  initStarRating();
  previewImageOnFileSelect();
  init_popover();

  flatpickr(".datepicker", {
    altInput: true,
    altFormat: "d M",
    dateFormat: "Z",
    minDate: "today",
    mode: "range",
  });

  flatpickr(".datetimepicker", {
    altInput: true,
    enableTime: true,
    altFormat: "F j, Y, H:i",
    dateFormat: "Z",
    minDate: "today",
    time_24hr: true,
  });
});
