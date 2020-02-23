require 'airport.rb'

describe Airport do 

  airport = Airport.new
  plane = Plane.new

  it "allows a plane to land" do
    expect(airport.land(plane)).to eq plane_landed
  end
  
end
