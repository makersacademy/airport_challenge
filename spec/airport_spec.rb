require 'airport'
require 'plane'

describe Airport do
  it "should allow a plane to land" do
    expect(Airport.new.request_to_land(Plane.new)).to eq true
  end

  it 'should store the information about landed planes' do
    airport = Airport.new
    airport.request_to_land(Plane.new)
    expect(airport.planes.count).to eq 1
  end
end
