require 'plane'

describe Plane do
  let(:airport) { double(:airport) }

  it 'creates plane' do
    expect(Plane.new).to be_a Plane
  end

  it 'new planes are automatically airbourne' do
    expect(Plane.new.airborne).to eq true
  end

  it 'a plane that takes off from airport becomes airborne' do
    plane = Plane.new
    allow(airport).to receive(:takeoff) { plane.taken_off }
    airport.takeoff

    expect(plane.airborne).to eq true
  end

  it 'a plane that lands in an airport is no longer airborne' do
    plane = Plane.new
    allow(airport).to receive(:land) { plane.landed }
    airport.land

    expect(plane.airborne).to eq false
  end
end
