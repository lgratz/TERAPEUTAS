function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-home');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-gray');
      } else {
        navbar.classList.remove('navbar-wagon-gray');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
