require 'airport'

describe Airport do
  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it 'Should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'Should have a default capacity that can be overwritten as appropriate' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end

  describe '#land' do 
    it { is_expected.to respond_to :land }

    it 'Should not let planes land when airport is full' do
      Airport::DEFAULT_CAPACITY.times do subject.land(Plane.new) end
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end

    it 'Planes that are landed can not land again and should be inside a airport' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'This plane is already landed'
    end
  end

  describe '#take_off' do
    it 'Should let plane take off and confirm it is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'Planes already in flight should not be able to take off' do
      expect { subject.take_off(Plane.new) }.to raise_error 'Plane already in flight'
    end

    it 'Planes should only be able to take off from the airport they are in' do
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      allow(airport1).to receive(:stormy?).and_return(false)
      allow(airport2).to receive(:stormy?).and_return(false)
      airport1.land(plane)
      expect { airport2.take_off(plane) }.to raise_error 'This plane is not in this station'
    end
  end

  context "In stormy conditions" do
    before do
      allow(subject).to receive(:stormy?).and_return(true)
    end

    it 'Should prevent landing when weather is stormy' do
      expect { subject.land double(:in_flight => true) }.to raise_error 'Cannot land when stormy'
    end

    it 'Should prevent take off when weather is stormy' do
      expect { subject.take_off double(:in_flight => true) }.to raise_error 'Cannot take off when stormy'
    end
  end
end
  