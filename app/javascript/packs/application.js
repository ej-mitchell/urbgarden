/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import React from 'react';
import ReactDOM from 'react-dom';
// import App from '../react/src/components/App';
import EventsIndexContainer from '../react/src/containers/EventsIndexContainer'
import EventShowContainer from '../react/src/containers/EventShowContainer'
import MapContainer from '../react/src/containers/MapContainer'
import AttendeeContainer from '../react/src/containers/AttendeeContainer'

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('index-app')) {
  ReactDOM.render(<EventsIndexContainer />, document.getElementById('index-app'));
  }

  if (document.getElementById("show-app")) {
    let appDiv = document.getElementById("show-app");
    let id = appDiv.dataset.id;

    ReactDOM.render(<EventShowContainer id={id}/>, document.getElementById('show-app'));
  }

  if (document.getElementById("attendee-app")) {
    let appDiv = document.getElementById("attendee-app");
    let id = appDiv.dataset.id;

    ReactDOM.render(<AttendeeContainer id={id}/>, document.getElementById('attendee-app'));
  }

  if (document.getElementById("map-app")) {
    ReactDOM.render(<MapContainer />, document.getElementById("map-app"))
  }
  // ReactDOM.render(<App />, document.getElementById('app'));

})
