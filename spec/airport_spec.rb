require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "will allow a plane to land" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to include(plane)
  end

  it 'will list planes that have landed' do
    airport = Airport.new
    expect(airport.list_planes).to eq(0)
  end

end
