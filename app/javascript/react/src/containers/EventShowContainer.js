import React from 'react';
import EventInfoTile from '../components/EventInfoTile';
import MapTile from '../components/MapTile';

class EventShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      event: {}
    }

  }

  fetchEvent() {
    let eventId = this.props.params.id;
    fetch(`/api/v1/events/${eventId}`)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({ event: responseData })
      })
  }

  componentDidMount() {
    this.fetchEvent();
  }

  render() {
    return(
      <div>
        <EventInfoTile
          id = {this.state.event.id}
          description = {this.state.event.description}
          start_time = {this.state.event.start_time}
          end_time = {this.state.event.end_time}
          address = {this.state.event.address}
          city = {this.state.event.city}
          state = {this.state.event.state}
          eventUrl={this.state.event.event_url}
        />

        <MapTile
          address = {this.state.event.address}
          city = {this.state.event.city}
          state = {this.state.event.state}
        />
      </div>
    )
  }
}

export default EventShowContainer;
