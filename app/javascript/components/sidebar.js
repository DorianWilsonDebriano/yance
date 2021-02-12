"use strict";

const btnsSelect = document.querySelectorAll(".sidebar-btn-select");
const btnsRadio = document.querySelectorAll(".sidebar-radio-group");
const btnReset = document.querySelector(".btn-reset");
const radioInput = document.querySelectorAll(".form-radio-input");

// open dropdown
btnsSelect.forEach((btn) => {
  btn.addEventListener("click", function (e) {
    e.preventDefault();
    let clicked = e.currentTarget;
    clicked.nextElementSibling.classList.toggle("open");
    clicked.querySelector(".sidebar-btn-arrow").classList.toggle("open");
  });
});

// click radio button
btnsRadio.forEach((radio, index) => {
  radio.addEventListener("change", function (e) {
    e.preventDefault();
    const userChoice = e.target.value;
    if (e.target.checked) {
      radio.parentElement.insertAdjacentHTML(
        "beforebegin",
        `    
        <div class="sidebar-choice">
          <img
            src="../assets/icons/checkmark-outline.svg"
            alt="checkmark yes"
            class="sidebar-choice-icon"
          />
            ${userChoice.charAt(0).toUpperCase() + userChoice.slice(1)}  
        </div>
        `
      );
    }
    radio.parentElement.classList.remove("open");
    const arrowSibling =
      radio.parentElement.previousElementSibling.previousElementSibling;

    arrowSibling
      .querySelector(".sidebar-btn-select .sidebar-btn-arrow")
      .classList.remove("open");
  });
});

// reset
btnReset.addEventListener("click", function (e) {
  e.preventDefault();
  document
    .querySelectorAll(".sidebar-choice")
    .forEach((choice) => choice.remove());

  radioInput.forEach((input) => {
    if (input.checked) {
      input.checked = false; // is this good practice? it works
    }
  });
});
