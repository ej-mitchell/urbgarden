import React from 'react';
import EventInfoTile from '../components/EventInfoTile';
// import MapContainer from './MapContainer';
import AttendeeContainer from './AttendeeContainer';

class EventShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      event: {},
      user: {}
    }

  }

  fetchEvent() {
    let eventId = this.props.params.id;
    fetch(`/api/v1/events/${eventId}`)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({ event: responseData.event, user: responseData.event.user })
      })
  }

  componentDidMount() {
    this.fetchEvent();
  }

  render() {
    let fullName = `${this.state.user.first_name} ${this.state.user.last_name}`
    return(
      <div>
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
            fullName={fullName}
            creatorCompany={this.state.user.company}
            creatorId={this.state.event.user_id}
          />

          <AttendeeContainer eventId={this.props.params.id}/>
        </div>

      </div>
    )
  }
}

export default EventShowContainer;
