import swal from 'sweetalert';

const initSweetalertAll = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelectorAll(selector);
  console.log(swalButton)
  if (swalButton) { // protect other pages
    swalButton.forEach( element =>
       element.addEventListener('click', () => {
       swal(options).then(callback);
       })
      )
  }
};

export { initSweetalertAll };
