require 'airport'

describe Airport do

  class Plane
  end

  let(:plane) { Plane.new }
  let(:new_airport) { Airport.new }

  it 'stores the names of the planes landing in an array' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.planes_on_ground).to eq [plane]
  end

  it 'raises and error if anything other than a Plane class instance tries to land' do
    class StarFighter
    end
    plane = StarFighter.new
    expect { subject.land(plane) }.to raise_error 'not an identifiable plane'
  end

  it 'does not let a plane already in the airport land again' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error 'plane is already in the airport'
  end

  it 'does not let a plane take off if it is not in the airport' do
    expect { subject.take_off(plane) }.to raise_error 'plane is not currently at this airport'
  end

  it 'removes a named plane from @planes_on_ground when it takes off and #stormy? == false' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'raises an error if a named plane from @planes_on_ground tries to take off and #stormy? == true' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error 'weather is stormy, plane can not take off'
  end

  it 'adds a named plane to @planes_on_ground array when it lands and #stormy? == false' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'raises an error if a named plane tries to land and #stormy? == true' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error 'landing denied, weather is stormy'
  end

  it 'creates a default capacity of 8 for the number of planes it can hold' do
    expect(subject.capacity).to eq(8)
  end

  it 'denies a plane landing if the airport is at capacity' do
    subject.instance_variable_set(:@planes_on_ground, [*1..8])
    expect { subject.land(plane) }.to raise_error 'landing denied, airport full'
  end

  it 'can set the capacity to 30 when creating new instance of Airport class' do
    new_airport = Airport.new(30)
    expect(new_airport.capacity).to eq 30
  end

end
