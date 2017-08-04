import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import EventShowContainer from '../containers/EventShowContainer';
import EventsIndexContainer from '../containers/EventsIndexContainer';

const App = props => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path="/" component={EventsIndexContainer}/>
        <Route path='/events/:id' component={EventShowContainer}/>
      </Router>
  </div>
  )
}

export default App;
