import React from 'react';

const Attendee = (props) => {
  return (
    <ul>
      <li><a href={`/users/${props.id}`}>{props.company}</a> – {props.grower}</li>
    </ul>
  )
}

export default Attendee;
