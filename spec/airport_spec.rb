require 'spec_helper'
require 'airport'
require 'weather_report'
require 'plane'

describe Airport do
  it 'allows planes to land' do
    airport = Airport.new
    expect(airport).to respond_to(:tower_permission_to_land)
  end
  it 'allows planes to take off' do
    expect(subject).to respond_to(:tower_permission_to_takeoff)
  end
  it 'checks that plane has taken off' do
    airport = Airport.new(1)
    plane = Plane.new(0)
   # weather = double("WeatherReport")
    allow(airport).to receive(:permission_to_land_granted?) { true }
    airport.tower_permission_to_land(plane)
    airport.tower_permission_to_takeoff
    expect(airport.ground_control_call).to eq 0
  end

end
