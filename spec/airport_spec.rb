require 'airport'
require 'plane'

describe Airport do
  it 'lets planes land' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { false }
    expect(subject.hangar).to include(plane)
  end

  it 'lets specific plane take off' do
    plane1 = Plane.new
    plane2 = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane1)
    subject.land(plane2)
    subject.take_off(plane1)
    allow(subject).to receive(:stormy?) { false }
    expect(subject.hangar).not_to include(plane1)
  end

  it 'confirms that plane is in hangar' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.plane_in_hangar?(plane)).to eq true
  end

  it 'confirms that plane is not in hangar' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    subject.take_off(plane)
    allow(subject).to receive(:stormy?) { false }
    expect(subject.plane_in_hangar?(plane)).to eq false
  end

  it 'prevents take off when weather is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error('No take off, weather is stormy!')
  end

  it 'prevents landing when weather is stormy' do
    plane = Plane.new
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error('No landing, weather is stormy!')
  end

  it 'prevents landing when the airport is full' do
    allow(subject).to receive(:stormy?) { false }
    20.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error('Airport is full!')
  end

  it 'checks when is full' do
    allow(subject).to receive(:stormy?) { false }
    20.times { subject.land(Plane.new) }
    expect(subject.full?).to eq true
  end

  it 'set the default capacity to 20' do
    expect(subject.capacity).to eq 20
  end

  it 'allows the default capacity to be overridden' do
    capacity = 30
    airport = Airport.new(capacity)
    expect(airport.capacity).to eq(capacity)
  end
end
