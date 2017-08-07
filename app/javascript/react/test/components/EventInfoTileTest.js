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
      fullName = "Eliza Mitchell"
      creatorId = {2}

    />)
  })

  it('should have headers', () => {
    expect(wrapper.find('h3').at(0).text()).toEqual("Description");
    expect(wrapper.find('h3').at(1).text()).toEqual("Time");
    expect(wrapper.find('h3').at(2).text()).toEqual("Address");
    expect(wrapper.find('h3').at(3).text()).toEqual("Event URL");
    expect(wrapper.find('h3').at(4).text()).toEqual("Event Creator");
  })

  it ('should have details about the event', () => {
    expect(wrapper.find('p').at(0).text()).toEqual("GBFG");
    expect(wrapper.find('p').at(1)).toIncludeText("09/09/10");
    expect(wrapper.find('p').at(2)).toIncludeText("123");
    expect(wrapper.find('p').at(3)).toIncludeText("Great Barrington");
    expect(wrapper.find('p').at(5)).toIncludeText("Eliza");
  })


  it ('should have a links associated with company and event', () => {
    expect(wrapper.find('a').at(0)).toHaveProp('href', 'http://www.google.com');
    expect(wrapper.find('a').at(1)).toHaveProp('href', `/users/2`)
  })


})
