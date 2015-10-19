require 'Airport'

describe Airport do
  let(:plane) {double :plane, :land => true, :take_off => true}

  it 'receive landing plane' do
    allow(subject).to receive(:weather) {'sunny'}
    subject.land plane
    expect(subject.planes).to include plane
  end

  it 'launch plane' do
    allow(subject).to receive(:weather) {'sunny'}
    subject.land plane
    subject.launch plane
    expect(subject.planes).to_not include plane
  end

  it 'does not allow plane to land in stormy weather' do
    allow(subject).to receive(:weather) {'stormy'}
    expect { subject.land plane }.to raise_error "Weather is stormy!"
  end

  it 'does not allow plane to take_off in stormy weather' do
    allow(subject).to receive(:weather) {'sunny'}
    subject.land plane
    allow(subject).to receive(:weather) {'stormy'}
    expect { subject.launch plane }.to raise_error "Weather is stormy!"
  end

  it 'does not allow plane to land if airport full' do
    allow(subject).to receive(:weather) {'sunny'}
    subject.capacity.times { subject.land plane }
    expect { subject.land plane }.to raise_error 'Airport is full'
  end

  it 'raises error if attempting to launch plane not in airport' do
    allow(subject).to receive(:weather) {'sunny'}
    expect { subject.launch(plane) }.to raise_error 'Plane is not here!'
  end

  it 'allows capacity setting' do
    subject.capacity = 10
    expect(subject.capacity).to eq 10
  end

  it 'sets default capacity' do
    expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
  end

end
