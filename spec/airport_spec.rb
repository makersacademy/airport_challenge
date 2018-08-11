require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it 'when stormy weather, plane cannot take off' do
    allow(subject).to receive(:weather_random) { 5 }
    expect { subject.plane_take_off(Plane.new) }.to raise_error "Bad weather, plane cannot take off"
  end

  it 'when stormy weather, plane cannot land' do
    allow(subject).to receive(:weather_random) { 5 }
    expect { subject.plane_land(Plane.new) }.to raise_error "Bad weather, plane cannot land"
  end

  before do
    allow(subject).to receive(:weather_random) { 15 }
  end

  it 'when airport is full, plane cannot land' do
    allow(subject).to receive(:full?) { true }
    error = "Airport full, plane cannot land"
    expect { subject.plane_land(plane) }.to raise_error error
  end

  it 'allow airport capacity to be overwritten' do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  it 'when plane is at airport returns true' do
    subject.plane_land(plane)
    expect(plane.at_airport).to eq(true)
  end

  it 'when plane has left airport, returns false' do
    subject.planes << plane
    subject.plane_take_off(plane)
    expect(plane.at_airport).to eq(false)
  end

  it 'when plane has landed, is part of planes' do
    subject.plane_land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'plane cannot take off if plane not in airport' do
    expect { subject.plane_take_off(plane) }.to raise_error "Plane not at airport"
  end

  it 'plane cannot land if already in airport' do
    subject.planes << plane
    expect { subject.plane_land(plane) }.to raise_error "Plane already at airport"
  end

end