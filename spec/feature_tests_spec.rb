require 'airport'

describe 'Feature Tests' do
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { Airport.new(10,weather) }
  let(:plane) { Plane.new }

  it 'can instruct planes to land or take off and confirm it happened' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new

    airport.land(plane1)
    airport.land(plane2)

    expect(airport.has?(plane1)).to eq true
    expect(airport.has?(plane2)).to eq true
    expect(airport.has?(plane3)).to eq false

    airport.take_off(plane1)

    expect(plane1.landed?).to eq false
    expect(plane2.landed?).to eq true
    expect(airport.has?(plane1)).to eq false
  end

  it 'planes can only land or take off when weather is fair' do
    allow(airport).to receive(:stormy?) { true }
    message = "Plane cannot land due to storm"
    expect { airport.land(plane) }.to raise_error message

    allow(airport).to receive(:stormy?) { false }
    expect(airport.land(plane))
    allow(airport).to receive(:stormy?) { true }
    message = "Plane cannot take off due to storm"
    expect { airport.take_off(plane) }.to raise_error message

    allow(airport).to receive(:stormy?) { false }
    expect(airport.take_off(plane))
  end

  it 'can create Airports with custom or default capacity' do
    message = "Cannot land as airport is full"

    small_airport = Airport.new(5)
    allow(small_airport).to receive(:stormy?) { false }
    5.times { small_airport.land(Plane.new) }
    expect { small_airport.land(Plane.new) }.to raise_error message

    regular_airport = Airport.new
    allow(regular_airport).to receive(:stormy?) { false }
    10.times { regular_airport.land(Plane.new) }
    expect { regular_airport.land(Plane.new) }.to raise_error message
  end
end
