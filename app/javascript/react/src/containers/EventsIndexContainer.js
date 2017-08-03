import React from 'react';
import EventTile from '../components/EventTile'

class EventsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: []
    }
  }

  fetchEvents() {
    fetch("/api/v1/events.json")
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({ events: responseData })
      })
  }

  componentDidMount() {
    this.fetchEvents();
  }

  render() {
    console.log(this.state.events)
    let eventMap = this.state.events.map((event) => {
      return (
        <EventTile
          key = {event.id}
          id = {event.id}
          name = {event.name}
          city = {event.city}
          state = {event.state}
        />
      )
    })

    return (
      <div>
        {eventMap}
      </div>
    )
  }
}

export default EventsIndexContainer
