require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it "When I land a plane, I expect that plane to be at the airport" do 
    airport = Airport.new
    boeing = Plane.new
    airport.land(boeing)
    expect(airport.planes).to include boeing
  end

  it "After instructing a plane to take off, I expect that plane to not be in the airport" do 
    airport = Airport.new
    boeing = Plane.new
    airport.land(boeing)
    airport.take_off
    expect(airport.planes).to be_empty
  end
end