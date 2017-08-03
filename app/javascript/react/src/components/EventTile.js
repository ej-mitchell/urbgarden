import React from 'react';

const EventTile = (props) => {
  return (
    <div id="event-div-home">
      <li className="event-list"><a className="event-list" href={`/events/${props.id}`}>{props.name} — {props.city}, {props.state}</a></li>
    </div>
  )
}

export default EventTile;
