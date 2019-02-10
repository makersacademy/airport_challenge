require "airport.rb"
require 'plane.rb'
describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq plane.plane_landed
  end

  it 'can take off a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.take_off(plane)).to eq plane.plane_flying?
  end
end
