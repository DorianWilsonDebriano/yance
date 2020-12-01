import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  altInput: true,
  // enableTime: true,
  altFormat: "d M Y",
  dateFormat: "Z",
  mode: "range"
});
