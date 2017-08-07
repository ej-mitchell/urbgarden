import React from 'react';
import {Map, Marker, GoogleApiWrapper} from 'google-maps-react';
import styles from '../../../../assets/stylesheets/urbgarden.css';

export class MapContainer extends React.Component {
  render () {
  return (
      <Map
        google = { this.props.google }
        zoom = {14}
        style={{width: '100%', height: '100%'}}
        className={style.map}
        containerStyle={{height: '35%', width: '35%', margin: "200px", }}
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
  // apiKey: (this.props.akey)
})(MapContainer)
