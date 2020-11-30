import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  altInput: true,
  altFormat: "d M Y",
  dateFormat: "Z",
  mode: "range"
});
