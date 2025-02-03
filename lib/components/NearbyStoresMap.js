import React, { useState, useEffect } from 'react';
import { GoogleMap, LoadScript, Marker, InfoWindow } from '@react-google-maps/api';

const mapContainerStyle = {
  width: '100%',
  height: '400px',
};

const center = {
  lat: 37.7749, // Default center (San Francisco)
  lng: -122.4194,
};

const NearbyStoresMap = () => {
  const [userLocation, setUserLocation] = useState(center);
  const [stores, setStores] = useState([]);
  const [selectedStore, setSelectedStore] = useState(null);

  // Get user's current location
  useEffect(() => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          setUserLocation({ lat: latitude, lng: longitude });
          fetchNearbyStores(latitude, longitude);
        },
        (error) => {
          console.error('Error fetching location:', error);
        }
      );
    }
  }, []);

  // Fetch nearby electronics stores using Places API
  const fetchNearbyStores = (lat, lng) => {
    const service = new window.google.maps.places.PlacesService(
      document.createElement('div')
    );

    const request = {
      location: { lat, lng },
      radius: 5000, // Search within 5km
      type: 'electronics_store',
      keyword: 'exchange OR sell',
    };

    service.nearbySearch(request, (results, status) => {
      if (status === window.google.maps.places.PlacesServiceStatus.OK) {
        setStores(results);
      }
    });
  };

  return (
    <LoadScript googleMapsApiKey="YOUR_GOOGLE_MAPS_API_KEY">
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        center={userLocation}
        zoom={14}
      >
        {stores.map((store) => (
          <Marker
            key={store.place_id}
            position={{
              lat: store.geometry.location.lat(),
              lng: store.geometry.location.lng(),
            }}
            onClick={() => setSelectedStore(store)}
          />
        ))}

        {selectedStore && (
          <InfoWindow
            position={{
              lat: selectedStore.geometry.location.lat(),
              lng: selectedStore.geometry.location.lng(),
            }}
            onCloseClick={() => setSelectedStore(null)}
          >
            <div>
              <h3>{selectedStore.name}</h3>
              <p>{selectedStore.vicinity}</p>
            </div>
          </InfoWindow>
        )}
      </GoogleMap>
    </LoadScript>
  );
};

export default NearbyStoresMap;