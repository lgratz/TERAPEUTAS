function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var therapistAddress = document.getElementById('therapist_address');

    if (therapistAddress) {
      var autocomplete = new google.maps.places.Autocomplete(therapistAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(therapistAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
