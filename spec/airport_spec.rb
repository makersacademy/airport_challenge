require 'airport'

describe Airport do
  it 'allows planes to land' do
    allow(subject).to receive(:stormy?) {false}
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    allow(subject).to receive(:stormy?) {false}
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms plane is not in the airport after take off' do
    allow(subject).to receive(:stormy?) {false}
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes_in_airport).to eq nil
  end
  
  it 'prevents plane from landing if airport is full' do
    allow(subject).to receive(:stormy?) {false}
    100.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'prevents plane from landing if weather is stormy' do
    allow(subject).to receive(:stormy?) {true}
    expect { subject.land(Plane.new) }.to raise_error 'Unsuitable weather conditions'
  end

  it 'prevents planes from taking off if weather is stormy' do
    allow(subject).to receive(:stormy?) {false}
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:stormy?) {true}
    expect { subject.take_off(plane) }.to raise_error 'Unsuitable weather conditions'
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      luton = Airport.new(20)
      allow(luton).to receive(:stormy?) {false}
      20.times { luton.land(Plane.new) }
      expect { luton.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

end
