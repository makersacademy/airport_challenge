require 'airport'

require 'plane'

describe Airport do
  it 'responds to the land method' do
    #airport = Airport.new
    expect(subject).to respond_to :land
  end

  it "to land a plane at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

  it "responds to the take_off method" do
    expect(subject).to respond_to :take_off
  end 
end
