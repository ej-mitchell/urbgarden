import EventInfoTile from '../../src/components/EventInfoTile';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('EventInfoTile', () => {
  let wrapper;
  let id;
  let description;
  let start_time;
  let end_time;
  let city;
  let state;
  let eventUrl;

  beforeEach(() => {
    wrapper = mount(<EventInfoTile
      id = {1}
      description = "GBFG"
      start_time = "09/09/10"
      end_time = "09/09/11"
      address = "123 Baker"
      city = "Great Barrington"
      state = "MA"
      eventUrl = "http://www.google.com"
    />)
  })

  it('should have headers', () => {
    expect(wrapper.find('h3').at(0).text()).toEqual("Description");
    expect(wrapper.find('h3').at(1).text()).toEqual("Time");
    expect(wrapper.find('h3').at(2).text()).toEqual("Address");
    expect(wrapper.find('h3').at(3).text()).toEqual("Event URL");
  })

  it ('should have details about the event', () => {
    expect(wrapper.find('p').at(0).text()).toEqual("GBFG");
    expect(wrapper.find('p').at(1)).toIncludeText("09/09/10");
    expect(wrapper.find('p').at(2)).toIncludeText("123");
    expect(wrapper.find('p').at(3)).toIncludeText("Great Barrington");
  })

  it ('should have a link present', () => {
    expect(wrapper.find('a')).toBePresent();
  })

  it ('should have a link with the correct url', () => {
    expect(wrapper.find('a')).toHaveProp('href', 'http://www.google.com');
  })


})
