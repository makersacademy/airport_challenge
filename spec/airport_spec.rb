require 'Airport'

describe Airport do
  let(:plane) {double :plane, :land => true, :take_off => true}

  it 'receive landing plane' do
    subject.land plane
    expect(subject.planes).to include plane
  end

  it 'launch plane' do
    subject.land plane
    subject.launch plane
    expect(subject.planes).to_not include plane
  end

  it 'does not allow plane to land if airport full' do
    subject.capacity.times { subject.land plane }
    expect { subject.land plane }.to raise_error 'Airport is full'
  end

  it 'raises error if attempting to launch plane not in airport' do
    expect { subject.launch(plane) }.to raise_error 'Plane is not here!'
  end

  it 'allows capacity setting' do
    subject.set_capacity(10)
    expect(subject.capacity).to eq 10
  end

  it 'sets default capacity' do
    expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
  end

end
