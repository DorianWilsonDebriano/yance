// 'use strict'


const enBtn = document.querySelector('.nav-link-english');
const deBtn = document.querySelector('.nav-link-german');

window.addEventListener('load', function(event) {
	let url = window.location.href
	if(url === 'http://127.0.0.1:3000/de') {
		enBtn.classList.add('switch');
		deBtn.classList.add('switch');
	} else {
		enBtn.classList.remove('switch');
		deBtn.classList.remove('switch');
	}

});




