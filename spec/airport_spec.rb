require "airport.rb"
require 'plane.rb'
describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq plane.plane_landed

  end
end
