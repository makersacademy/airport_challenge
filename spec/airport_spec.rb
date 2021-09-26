require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'responds to the method full?' do
    expect(subject).to respond_to(:full?)
  end

  it 'responds to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'responds to the land method' do
    expect(subject).to respond_to(:land)
  end
end

describe "#takeoff" do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it 'should allow a plane to take off from the airport if there is one present' do
    # airport = Airport.new
    # plane = Plane.new
    @airport.land(@plane)
    expect(@airport.takeoff(@plane)).to eq(@plane)
  end

  it 'should return a message if no planes are landed' do
    # airport = Airport.new
    # plane = Plane.new
    expect(@airport.takeoff(@plane)).to eq("Error. There are no planes to take off.")
  end

  # it 'allows a plane to take off from the airport if the weather is clear' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   weather = Weather.new
  #   allow(weather).to receive(:rand).and_return(1)
  #   expect(weather.forecast).to eq(true)
  #   expect(airport.takeoff(plane)).to eq plane
  # end

  # it 'should throw an error if the weather is too stormy' do
  #   airport = Airport.new
  #   plane = Plane.new
  #   weather = Weather.new
  #   allow(weather).to receive(:rand).and_return(2)
  #   expect(weather.forecast).to eq(false)
  #   expect(airport.takeoff(plane)).to eq("Weather too stormy to take off")
  # end

end

describe "#land" do
  it 'lands a plane at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.airport.length).to eq 1
  end
end

describe "#full" do
  # before do
  #   airport = Airport.new
  # end

  it 'should return 0 if no planes have been landed' do
    airport = Airport.new
    expect(airport.full?).to eq 0 
  end
  it 'should return 1 if a plane exists at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.full?).to eq 1
  end
end
