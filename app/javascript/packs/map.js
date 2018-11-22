import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    // map.setCenter(markers[0].lat, markers[0].lng);
    // map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  if(navigator.geolocation){

         // call this function to get the location
    navigator.geolocation.getCurrentPosition(function(position) {
         // the results return as a lat lng,
         //which we will put them into a variable to use in Google's Geocoder
      var Mypos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
      };
      console.log(Mypos)

      const info = {
        content: "Minha localização"
      };

      map.addMarker({
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        infoWindow: info,
        icon: "http://icons-for-free.com/free-icons/png/48/1891016.png"
      });
    map.setZoom(14);
    map.panTo(Mypos);
    });
   }

  const styles = [ {
    "featureType": "administrative",
    "elementType": "all",
    "stylers": [
      {
          "saturation": "-100"
      }
    ]
  },
  {
      "featureType": "administrative.province",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  },
  {
      "featureType": "landscape",
      "elementType": "all",
      "stylers": [
          {
              "saturation": -100
          },
          {
              "lightness": 65
          },
          {
              "visibility": "on"
          }
      ]
  },
  {
      "featureType": "poi",
      "elementType": "all",
      "stylers": [
          {
              "saturation": -100
          },
          {
              "lightness": "50"
          },
          {
              "visibility": "simplified"
          }
      ]
  },
  {
      "featureType": "road",
      "elementType": "all",
      "stylers": [
          {
              "saturation": "-100"
          }
      ]
  },
  {
      "featureType": "road.highway",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "simplified"
          }
      ]
  },
  {
      "featureType": "road.arterial",
      "elementType": "all",
      "stylers": [
          {
              "lightness": "30"
          }
      ]
  },
  {
      "featureType": "road.local",
      "elementType": "all",
      "stylers": [
          {
              "lightness": "40"
          }
      ]
  },
  {
      "featureType": "transit",
      "elementType": "all",
      "stylers": [
          {
              "saturation": -100
          },
          {
              "visibility": "simplified"
          }
      ]
  },
  {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
          {
              "hue": "#ffff00"
          },
          {
              "lightness": -25
          },
          {
              "saturation": -97
          }
      ]
  },
  {
      "featureType": "water",
      "elementType": "labels",
      "stylers": [
          {
              "lightness": -25
          },
          {
              "saturation": -100
          }
      ]
  } ];

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

}

autocomplete();

