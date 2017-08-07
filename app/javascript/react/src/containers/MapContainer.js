import React from 'react';
import {Map, Marker, GoogleApiWrapper} from 'google-maps-react';
import style from '../../../../assets/stylesheets/urbgarden.css';

export class MapContainer extends React.Component {
  render () {
  return (
      <Map
        google = { this.props.google }
        zoom = {14}
        style={{width: '100%', height: '100%'}}
        containerStyle={{ height: '70%',
          width: '50%',
          "margin-top": "55px",
          "margin-bottom": "60px",
          "margin-left": "20px"
          }}
        >

        <Marker
          name={'Dolores park'}
          position={{lat: 37.759703, lng: -122.428093}}
        />

      </Map>
    );
  }
}


export default GoogleApiWrapper({
  // apiKey: (this.props.env)
})(MapContainer)
