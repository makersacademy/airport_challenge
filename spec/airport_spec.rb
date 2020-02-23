require 'airport'

describe Airport do

  it '#lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'raises an error when full' do
    allow(subject).to receive(:storm?).and_return false
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'took off a plane' do
    allow(subject).to receive(:storm?) { false }
    expect(subject.takeoff).to eq 'Airplane has took off'
  end

  it 'there is a storm' do
    allow(subject).to receive(:storm?) { true }
  end

  it 'generates random weather state between storm or not' do
    allow(subject).to receive(:rand).and_return(4)
    expect(subject.storm?).to eq true
  end

  it 'Airport is closed for landing due to the storm' do
    allow(subject).to receive(:full?) { false }
    allow(subject).to receive(:storm?) { true }
  end

end
