function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-home');
      } else {
        navbar.classList.add('navbar-wagon');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
