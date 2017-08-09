import React from 'react';
import Attendee from '../components/Attendee';

class AttendeeContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      eventId: this.props.eventId,
      userEvents: []
    }

  }

  fetchEvent() {
    fetch(`/api/v1/user_events`)
      .then((response) => response.json())
      .then((responseData) => {
        let payLoad = [];
        responseData.user_events.forEach((attendee) => {
          if (attendee.event_id == this.state.eventId) {
            payLoad = [...payLoad, attendee]
          }
        })
        this.setState({ userEvents: payLoad })
      })
  }

  componentDidMount() {
    this.fetchEvent();
  }

  render() {
    let attendeesMap = this.state.userEvents.map((attendee) => {
      let fullName = `${attendee.grower.first_name} ${attendee.grower.last_name}`;
      let company = `${attendee.grower.company}`;
      return(
        <Attendee
          key={attendee.grower_id}
          id={attendee.grower_id}
          grower={fullName}
          company={company}
        />
      )
    })
    return(
      <div>
        <h3 id="event-header">Attendees</h3>
        {attendeesMap}
      </div>
    )
  }
}

  export default AttendeeContainer;
