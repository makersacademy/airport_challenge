# A plane currently in the airport can be requested to take off.

require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'airport can land and take off planes' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'airplane can land and take off' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    airport.land plane
    airport.take_off
  end
  scenario 'plane cannot land if airport is full (6 planes)' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    6.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'airport is full'
  end
  scenario 'airport can not issue take off requests if no airplanes' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    expect { airport.take_off }.to raise_error 'airport is currently empty'
  end
  context 'weather conditions' do
    scenario 'a plane cannot take off when there is a storm brewing' do
      allow(airport).to receive(:local_weather) { 'sunny' }
      airport.land plane
      allow(airport).to receive(:local_weather) { 'stormy' }
      expect { airport.take_off }.to raise_error 'not now, storms brewing!'
    end
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    it 'a plane cannot land in the middle of a storm' do
      allow(airport).to receive(:local_weather) { 'stormy' }
      expect { airport.land plane }.to raise_error 'not now, storms brewing!'
    end
  end
end
