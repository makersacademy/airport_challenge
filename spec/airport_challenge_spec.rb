require './docs/plane'
require './docs/airport'
require './docs/weather'

describe Airport do
  before { allow(Weather).to receive(:stormy?) { false } }
  let(:plane) { double :plane }

  it 'instruct plane to land at airport' do
    subject.land(plane)
    expect(subject.planes.include? plane).to eq true
  end

  it 'instruct plane to take off from airport' do
    subject.take_off(plane)
    expect(subject.planes.include? plane).to eq false
  end

  it 'confirm plane that has taken off is no longer in airport' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.confirm_take_off(plane)).to eq 'Plane has taken off.'
  end

  it 'raise error if confirming take off and plane is still at airport' do
    subject.land(plane)
    expect { subject.confirm_take_off(plane) }.to raise_error('Plane has not taken off.')
  end

  it 'raise error if landing a plane to full airport' do
    expect { (subject.capacity + 1).times { subject.land(plane) } }.to raise_error('Airport is full!')
  end

  it 'accepts capacity argument' do
    expect(Airport.new(25).capacity).to eq 25
  end

  it 'sets DEFAULT_CAPACITY if no capacity argument passed' do
    subject.capacity.times { subject.land(plane) }
    expect(subject.planes.count).to eq Airport::DEFAULT_CAPACITY
  end

  it 'raise error if landing a plane & weather is stormy' do
    allow(Weather).to receive(:stormy?) { true }
    expect { subject.land(plane) } .to raise_error('Weather is stormy, cannot land')
  end

  it 'raise error if a plane is taking off & weather is stormy' do
    allow(Weather).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error('Weather is stormy, cannot take off')
  end
  
end

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'returns false when weather is not stormy' do
    allow(Weather).to receive(:stormy?) { false }
    expect(subject.stormy?).to eq false
  end
end
