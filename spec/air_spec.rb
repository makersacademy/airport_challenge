require 'airport'
require 'air'
require 'plane'
require 'weather'
require 'air_control'

describe Air do
  it 'checks status when the planes are in the air' do
    central_control = AirControl.new
    airport1 = Airport.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect(can.status).to eq "In Canada's airspace: CX255"
  end

  it 'checks status when no plane is in the air' do
    central_control = AirControl.new
    airport1 = Airport.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    expect(can.status).to eq "In Canada's airspace: none"
  end
end
