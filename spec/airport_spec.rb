require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  it 'can respond to land' do
    expect(airport).to respond_to(:land)
  end

  # 1. discussed with Lindsay on Mon 20 May for correct test (vs. incorrect @ the 2nd) 
  it 'expects planes can land at the airport' do
    airport_two = Airport.new(weather) # => declare a new instance of the Airport class, and insert double of weather as parameter
    allow(weather).to receive(:stormy) {false} # => stub to ensure randomness
    airport_two.land(plane) 
    output = airport_two.planes.length
    expect(output).to eq(1)
  end
 
  # # 2. the previous code (assumed the default parameter to 'Airport.new' was a NEW instance of Weather, not the dummy)
  # it 'expects planes can land at the airport' do
  #   airporttwo = Airport.new(Weather.new) # => by default a new instance of weather is created, but it needs to be a double
  #   airporttwo.land(plane) 
  #   output = airporttwo.planes.length
  #   expect(output).to eq(1)
  # end

  # 3. previous version in Git pull request, reviewed by coaches
  # it 'expects planes can land at the airport' do
  #   allow(weather).to receive(:stormy) {false}
  #   airport.land(plane) # => num of planes  = 1
  #   output = airport.planes.length
  #   expect(output).to eq(1)
  # end

  it 'can add planes to the planes array total' do
    airport_two = Airport.new(weather)
    allow(weather).to receive(:stormy) {false}
    5.times {airport_two.land(plane)}
    output = airport_two.planes.length
    expect(output).to eq(5)
  end

  it 'can respond to plane_takeoff' do
    expect(airport).to respond_to(:plane_takeoff)
  end

  it 'expects planes can leave the airport' do
    airport_two = Airport.new(weather)
    allow(weather).to receive(:stormy) {false}
    airport_two.land(plane) # => num of planes should = 1
    airport_two.plane_takeoff # => num of planes should = 0
    output = airport_two.planes.length
    expect(output).to eq(0)
  end

  it 'can raise an error if there are no planes to take-off' do 
    expect { airport.plane_takeoff }.to raise_error("There are no planes in the airport")
  end

  it 'prevents plane take-off when weather is stormy' do
    airport_two = Airport.new(weather)
    allow(weather).to receive(:stormy) {false}
    airport_two.land(plane)
    allow(weather).to receive(:stormy) {true}
    expect { airport_two.plane_takeoff }.to raise_error("Plane cannot take-off due to stormy weather")
  end
 
  it 'prevents plane landing when weather is stormy' do
    airport_two = Airport.new(weather)
    allow(weather).to receive(:stormy) {true}
    expect { airport_two.land(plane) }.to raise_error("Plane cannot land due to stormy weather")
  end

  it 'prevents a plane landing if the airport is full' do
    airport_two = Airport.new(weather)
    allow(weather).to receive(:stormy) {false}
    airport_two.capacity.times {airport_two.land(plane)}
    expect{airport_two.land(plane)}.to raise_error('Airport at full capacity')
  end

  it 'has a default capacity if no capacity argument is passed' do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

end