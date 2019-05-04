require 'airport'
require 'plane'

describe Airport do
  before :each do
    @airport = Airport.new
  end

  it 'is empty by default' do
    expect(@airport.planes).to be_empty
  end

  it 'has a land method which requires an argument' do
    expect(@airport).to respond_to(:land).with(1).argument
  end

  it 'can be used to land at' do
    plane = Plane.new
    @airport.land(plane)

    expect(@airport.planes).to include(plane)
    expect(@airport.planes.size).to eq(1)
  end

  it 'has a take_off method which requires an argument' do
    expect(@airport).to respond_to(:take_off).with(1).argument
  end

  it 'can be used to take off from' do
    plane = Plane.new
    @airport.land(plane)
    @airport.take_off(plane)

    expect(@airport.planes).not_to include(plane)
    expect(@airport.planes.size).to eq(0)
  end
end
