import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  altInput: true,
  altFormat: "d M Y",
  dateFormat: "Z",
  mode: "range"
});

flatpickr(".datetimepicker", {
  altInput: true,
  enableTime: true,
  altFormat: "F j, Y, H:i",
  dateFormat: "Z",
  minDate: "today",
  time_24hr: true
});
