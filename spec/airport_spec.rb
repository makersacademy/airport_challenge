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

  before(:example) do
    @airport = Airport.new
    @plane = double :plane
    allow(@plane).to receive(:land)
    allow(@plane).to receive(:take_off)
  end

  it 'can pass capacity on initialization' do
    airport = Airport.new 50
    expect(airport.capacity).to eq(50)
  end

  it 'assigns a default capacity if none specified' do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'is empty when initialized' do
    expect(@airport.planes).to eq([])
  end

  it 'releases a plane' do
    allow(@airport).to receive (:stormy) {false}
    @airport.instruct_to_land(@plane)
    @airport.instruct_to_take_off(@plane)
    expect(@airport.planes).to eq([])
  end

  it 'receives a plane' do
    allow(@airport).to receive (:stormy) {false}
    @airport.instruct_to_land(@plane)
    expect(@airport.planes). to eq([@plane])
  end


  it 'does not allow a plane to land when airport is full' do
    allow(@airport).to receive(:stormy) {false}
    @airport.capacity.times {@airport.instruct_to_land @plane}
    expect{ @airport.instruct_to_land @plane }.to raise_error "Do not have permission to land"
  end

  it 'does not allow a plane to take off unless it is currently docked in the airport' do
      allow(@airport).to receive(:stormy) {false}
      expect{ @airport.instruct_to_take_off @plane}.to raise_error "Plane not in airport"
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

  it 'assigns weather type to airport, stormy is either true or false' do
      expect(@airport.stormy).to eq(true).or eq(false)
  end

  it 'does not allow plane to take off in stormy weather' do
      allow(@airport).to receive(:stormy) {false}
      @airport.instruct_to_land(@plane)
      allow(@airport).to receive(:stormy) {true}
      expect{ @airport.instruct_to_take_off(@plane) }.to raise_error "Do not have permission to take off"
  end

  it 'does not allow plane to land in stormy weather' do
      allow(@airport).to receive(:stormy) {true}
      expect{ @airport.instruct_to_land(@plane) }.to raise_error "Do not have permission to land"
  end

end
