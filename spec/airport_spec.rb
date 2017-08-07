require 'airport'
require 'air'
require 'plane'
require 'weather'
require 'air_control'

describe Airport do

  it 'sets default capacity' do
    airport1 = described_class.new("Heathrow")
    expect(airport1.capacity).to eq(50)
  end

  it 'does not allow plane takeoff in bad weather conditions' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "stormy" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect(airport1.planes).to include [plane1, plane1.name]
  end

  it 'allows plane takeoff in bad weather conditions' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect(can.planes).to include [plane1, plane1.name]
  end

  it 'does not allow plane landing in bad weather conditions' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    allow(airport1).to receive(:check_weather) { "stormy" }
    airport1.land(plane1, can, central_control)
    expect(can.planes).to include [plane1, plane1.name]
  end

  it 'allows plane landing in good weather conditions' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    airport1.land(plane1, can, central_control)
    expect(airport1.planes).to include [plane1, plane1.name]
  end

  it 'confirms plane is in airspace after successful takeoff' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect(can.planes).to include [plane1, plane1.name]
  end

  it 'confirms plane is no longer in airspace after successful landing' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    airport1.land(plane1, can, central_control)
    expect(can.planes).not_to include [plane1, plane1.name]
  end

  it 'prevents any plane from landing when airport is at full capacity' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow", 1)
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    plane2 = Plane.new("CX200")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    airport1.from_factory(plane2)
    expect(can.planes).to include [plane1, plane1.name]
  end

  it 'raises an error when an airport was to takeoff an already flying plane' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    expect { airport1.takeoff(plane1, can, central_control) }.to raise_error("Plane CX255 is not in Heathrow. Takeoff will not proceed.")
  end

  it 'raises an error when a plane was to land twice in an airport' do
    central_control = AirControl.new
    airport1 = described_class.new("Heathrow")
    allow(airport1).to receive(:check_weather) { "sunny" }
    plane1 = Plane.new("CX255")
    can = Air.new("canada")
    airport1.from_factory(plane1, central_control)
    airport1.takeoff(plane1, can, central_control)
    airport1.land(plane1, can, central_control)
    expect { airport1.land(plane1, can, central_control) }.to raise_error("Plane CX255 has already landed at Heathrow.")
  end

  it 'can override the default capacity' do
    airport1 = described_class.new("Heathrow")
    airport1.capacity = 2
    expect(airport1.capacity).to eq 2
  end

end
