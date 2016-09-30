require "airport"

describe Airport do

  let(:plane) { double :plane }

  it 'allows a plane to land' do
      expect(subject.land(plane)).to eq [plane]
  end

  it 'won\t allow a plane to land if the airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error 'Cannot land. Airport is full.'
  end

  it 'allows a plane to takeoff' do
      expect(subject.takeoff(plane)).to eq plane
  end

  it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'allows you to change the capacity' do
      subject.capacity = 15
      expect(subject.capacity).to eq 15
  end

end
