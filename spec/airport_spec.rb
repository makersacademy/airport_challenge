require 'airport'
require 'plane'

describe Airport do
  before :each do
    @airport = Airport.new
  end

  it "is empty by default" do
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


end
