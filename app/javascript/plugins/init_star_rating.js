import "jquery-bar-rating";
 // <-- if you're NOT using a Le Wagon template (cf jQuery section)
import $ from 'jquery';
const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
