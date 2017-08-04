import EventTile from '../../src/components/EventTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('EventTile', () => {
  let wrapper;
  let id;
  let name;
  let city;
  let state;

  beforeEach(() => {
    wrapper = mount(<EventTile
      id = {1}
      name = "GBFG"
      city = "Great Barrington"
      state = "MA"
    />)
  })

  it ('should display the name of the event', () => {
    expect(wrapper.find('li')).toIncludeText('GBFG');
  })

  it ('should display the city of the event', () => {
    expect(wrapper.find('li')).toIncludeText('Great Barrington')
  })

  it ('should display the state of the event', () => {
    expect(wrapper.find('li')).toIncludeText('MA')
  })

  it ('should have a link present', () => {
    expect(wrapper.find('a')).toBePresent();
  })

  it ('should have a link with the correct url', () => {
    expect(wrapper.find('a')).toHaveProp('href', '/events/1');
  })


})
