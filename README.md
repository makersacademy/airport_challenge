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
  let(:plane) {double :plane} # using a double here because I created a separate class

  describe '#airport_full?' do
    it 'does not land planes when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.can_land(plane) }
      expect { airport.can_land(plane) }.to raise_error "airport is full now, cannot land any planes"
    end
  end

*********************************
User Story 4: create the capacity that can be overridden if needed.
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
Tests:
 describe '#initialize' do
    it 'has the capacity that can be overridden when needed' do
      airport.capacity == Airport::DEFAULT_CAPACITY # here I wasn't sure if I need to write 35 or the DEFAULT_CAPACITY const?
      expect(airport.capacity).to eq 35
    end
  end
************************************
User Story 5: create weather conditions class and if it's stormy, prevent the takeoff
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy
Tests:
 

