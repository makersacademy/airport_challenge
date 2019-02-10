require "airport.rb"
require 'plane.rb'
describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq plane.plane_landed
  end

  it 'confirm plane landed' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.plane_flying?).to eq true
  end

  it 'can take off a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.take_off(plane)).to eq plane.plane_flying?
  end

  it 'confirm plane takeoff' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.plane_takeoff).to eq true
  end
end
