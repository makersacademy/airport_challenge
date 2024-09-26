require 'airport'

describe Airport do

  it 'allows planes to land' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms plane is not in the airport after take off' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes_in_airport).to eq nil
  end
  
  it 'prevents plane from landing if airport is full' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    100.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport full'
  end

  it 'prevents plane from landing if weather is stormy' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error 'Unsuitable weather conditions'
  end

  it 'prevents planes from taking off if weather is stormy' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error 'Unsuitable weather conditions'
  end

  it 'does not allow plane to take off from airport if not already in airport' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { false }
    expect { subject.take_off(plane) }.to raise_error 'Plane not in airport'
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      plane = double(:plane)
      luton = Airport.new(20)
      allow(luton).to receive(:stormy?) { false }
      20.times { luton.land(plane) }
      expect { luton.land(plane) }.to raise_error 'Airport full'
    end
  end

end
