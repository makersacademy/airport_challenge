Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
********************************
User Story 1: land a plane at an airport.
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Tests:
#in airport_spec.rb
require 'airport'
describe Airport do
  describe '#can_land_a_plane' do
  it 'lands a plane at an airport' do
    airport = Airport.new
    airport.can_land_a_plane('new_flight_num')
    expect(airport.hangar).to include 'new_flight_num'
  end
  end
end

********************************
User Story 2: plane takes off and is no longer at an airport.
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Tests:
#in airport_spec.rb
require 'airport'

describe Airport do
  
  let(:airport) {Airport.new}

  describe '#can_land_a_plane' do
  it 'lands a plane at an airport, registers it' do
    airport.can_land_a_plane('new_flight_num')
    expect(airport.capacity).to include 'new_flight_num'
  end
  end
  describe '#can_take_off' do
  it 'plane can take off and will be removed from the airport capacity' do
    airport.can_land_a_plane('new_flight_num')
    airport.can_take_off('new_flight_num')
    expect(airport.capacity).not_to include 'new_flight_num'
  end
  end
end

********************************
User Story 3: do not land planes when the airport is full.
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
Tests:


