require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  it 'can pass capacity on initialization' do
    airport = Airport.new 50
    expect(airport.capacity).to eq(50)
  end

  it 'assigns a default capacity if none specified' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'is empty when initialized' do
    airport = Airport.new
    expect(airport.planes).to eq([])
  end

  it 'releases a plane' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive (:stormy) {false}
    airport.instruct_to_land(plane)
    airport.instruct_to_take_off(plane)
    expect(airport.planes).to eq([])
  end

  it 'receives a plane' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive (:stormy) {false}
    airport.instruct_to_land(plane)
    expect(airport.planes). to eq([plane])
  end


  it 'does not allow a plane to land when airport is full' do
      airport = Airport.new
      allow(airport).to receive(:stormy) {false}
      airport.capacity.times {airport.instruct_to_land Plane.new}
      expect{ airport.instruct_to_land Plane.new }.to raise_error "Do not have permission to land"
  end

      it 'does not allow a plane to take off unless it is currently docked in the airport' do
        airport = Airport.new
        allow(airport).to receive(:stormy) {false}
        expect{ airport.instruct_to_take_off Plane.new}.to raise_error "Plane not in airport"
      end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    it {is_expected.to respond_to :stormy}


      it 'does not allow a plane to take off when weather is stormy' do
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy) {false}
        airport.instruct_to_land(plane)
        allow(airport).to receive(:stormy) {true}
        expect{ airport.instruct_to_take_off(plane) }.to raise_error "Do not have permission to take off"
      end

      it 'does not allow a plane to land when weather is stormy' do
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy) {true}
        expect{ airport.instruct_to_land(plane) }.to raise_error "Do not have permission to land"
    end

end
