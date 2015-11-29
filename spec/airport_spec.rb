require 'airport'

describe Airport do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands the plane at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'raise error when airport is full' do
    plane = Plane.new
    subject.land(plane)
    expect {Airport::DEFAULT_CAPACITY.times do
    subject.land(plane) end }.to raise_error 'Airport is full'
  end

  it 'does not allow plane to land in stormy weather' do
    plane = Plane.new
    allow(plane).to receive(:stormy?).and_return true
    expect(subject).to raise_error 'planes are not allowed to land in stormy weather'
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

    it 'does not allow plane to take off in stormy weather' do
      plane = Plane.new
      subject.land(plane)
      allow(plane).to receive(:stormy?).and_return true
      expect(subject.take_off(plane)).to raise_error 'planes are not allowed to take off in stormy weather'
    end
end
end
