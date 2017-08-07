require 'airport'
require 'air'
require 'plane'
require 'weather'
require 'air_control'

describe Plane do

  it 'checks status when new planes are transferred from factory' do
    central_control = AirControl.new
    airport1 = Airport.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = described_class.new("CX255")
    airport1.from_factory(plane1, central_control)
    expect(plane1.status(central_control)).to eq "Plane CX255 is currently at the Heathrow Airport."
  end

  it 'checks status when the plane is in the air' do
    central_control = AirControl.new
    airport1 = Airport.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = described_class.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect(plane1.status(central_control)).to eq "Plane CX255 is currently in Canada's airspace."
  end

  it 'checks status after the plane has landed' do
    central_control = AirControl.new
    airport1 = Airport.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = described_class.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    airport1.land(plane1, can, central_control)
    expect(plane1.status(central_control)).to eq "Plane CX255 is currently at the Heathrow Airport."
  end

end
