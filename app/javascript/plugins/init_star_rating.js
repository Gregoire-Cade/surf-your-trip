import "jquery-bar-rating";

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'bars-square'
    });
  };

export { initStarRating };