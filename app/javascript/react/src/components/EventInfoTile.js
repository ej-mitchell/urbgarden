import React from 'react';

const EventInfoTile = (props) => {
  return (
    <div>
      <h3 id="event-header">Description</h3>
      <p>{props.description}</p>
      <h3 id="event-header">Time</h3>
      <p>{props.start_time} — {props.end_time}</p>
      <h3 id="event-header">Address</h3>
      <p>{props.address},</p>
      <p>{props.city}, {props.state}</p>
      <h3 id="event-header">Event URL</h3>
      <p><a href={`${props.eventUrl}`}>{props.eventUrl}</a></p>
      <h3 id="event-header">Event Creator</h3>
      <p>{props.fullName} — <a href={`/users/${props.creatorId}`}>{props.creatorCompany}</a></p>
    </div>
  )
}
export default EventInfoTile;
