require'airport'
require'plane'

describe Airport do
  let (:plane) { Plane.new }  

  it 'accepts capacity argument' do
    expect(Airport.new(100).capacity).to eq 100
  end

  it 'weather stormy or not' do
    allow(subject).to receive(:random_states) { :stormy }
    expect(subject.stormy?).to eq true
  end

  it 'airport capcacity check' do
    allow(subject).to receive(:stormy?) { false }
    subject.capacity.times { plane.state = :flying
                             subject.land(plane)
    }    
    expect { subject.land(plane) }.to raise_error 'Airport is full,cannot land'
  end  

  describe '#TakeOff' do
    it 'does not allow plane to take off' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy,cannot takeoff'
    end

    it 'takeoff successful' do
      allow(subject).to receive(:stormy?) { false }
      subject.take_off(plane)
      expect(plane.state).to eq(:flying)
    end

    it 'takeoff failure due to wrong plane state' do
      allow(subject).to receive(:stormy?) { false }
      plane.state = :flying
      expect { subject.take_off(plane) }.to raise_error 'plane already flying'
    end
    it 'take off plane from airport updating planes present at airport' do
      allow(subject).to receive(:stormy?) { false }
      plane.state = :flying
      subject.land(plane) 
      subject.take_off(plane)
      expect(subject.planes.include? plane).to eq false
    end
  end
  

  describe '#Land' do
    it 'does not allow plane to land' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'Weather is stormy,cannot land'
    end
    it 'landing successful' do
      allow(subject).to receive(:stormy?) { false }
      plane.state = :flying
      subject.land(plane)
      expect(plane.state).to eq(:landed)
    end
    it 'landing failure due to plane state' do
      allow(subject).to receive(:stormy?) { false }
      plane.state = :landed
      expect { subject.land(plane) }.to raise_error 'plane already landed'
    end
    it 'landing plane at airport adding planes present at airport' do
      allow(subject).to receive(:stormy?) { false }
      plane.state = :flying
      subject.land(plane)
      expect(subject.planes.include? plane).to eq true
    end
  end

end
