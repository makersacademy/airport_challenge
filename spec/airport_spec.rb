require 'airport'

describe Airport do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands the plane at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'raise error when airport is full' do
    subject.land(plane)
    expect {Airport::DEFAULT_CAPACITY.times do
    subject.land(plane) end }.to raise_error 'Airport is full'
  end

  it 'Has a default capacity of DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'allows plane to take off from airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
end
end
