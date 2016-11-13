require './lib/airport'
require './lib/weather'
describe Airport do

  it 'responds to release_plane' do
    expect(subject).to respond_to :release_plane
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it 'lands a plane' do
    allow(subject.weather).to receive(:stormy?) { false }
    expect(subject.land(@plane)).to eq subject.planes
  end

  it 'confirms planes have landed' do
    allow(subject.weather).to receive(:stormy?) { false }
    subject.land(@plane)
    expect(subject.planes).to eq subject.planes
  end

  it 'ensures planes that have already landed cannot land again' do
    allow(subject.weather).to receive(:stormy?) { false }
    subject.land(@plane)
    expect { subject.land(@plane) }.to raise_error 'plane has already landed'
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'instructs a plane to take off' do
    allow(subject.weather).to receive(:stormy?) { false }
    subject.land(@plane)
    expect(subject.take_off(@plane)).to eq @plane
  end

  it 'ensures planes can only take off from airports they are in' do
      allow(subject.weather).to receive(:stormy?) { false }
    expect { subject.take_off(@plane) }.to raise_error 'no planes to take off'
  end

  it 'ensures planes already flying cannot takeoff' do
    allow(subject.weather).to receive(:stormy?) { false }
    subject.land(@plane)
    subject.take_off(@plane)
    expect { subject.take_off(@plane) }.to raise_error 'no planes to take off'
  end

  it 'confirms planes are no longer in the airport after take off' do
      allow(subject.weather).to receive(:stormy?) { false }
    subject.land(@plane)
    subject.take_off(@plane)
    expect(subject.planecount).to eq 0
  end

  it 'prevents planes from landing if weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return true
    expect { subject.land(@plane) }.to raise_error 'plane cannot land in stormy weather'
  end

  it 'prevents planes from take off if weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return false
    subject.land(@plane)
    allow(subject.weather).to receive(:stormy?).and_return true
    expect { subject.take_off(@plane) }.to raise_error 'plane cannot take off in stormy weather'
  end

  it 'has a default capacity of 5 planes and stops planes from landing if it is full' do
    allow(subject.weather).to receive(:stormy?).and_return false
    5.times {subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "Airport is full"
  end

  it 'has a capacity that can be overriden as appropraite' do
    airport = Airport.new(7)
    allow(airport.weather).to receive(:stormy?).and_return false
    7.times {airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is full"
  end

end
