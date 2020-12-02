export const magicBtn = () => {
  $('.magicBtn').on('mouseenter mouseleave', function(){
    $('.moveGroup').toggleClass('activate');
  });
};
