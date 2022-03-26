require 'airport'

describe Airport do
  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it 'Should have a default capacity that can be overwritten as appropriate' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end

  describe '#land' do 
    it { is_expected.to respond_to :land }

    it 'Should not let planes land when airport is full' do
      Airport::DEFAULT_CAPACITY.times do subject.land(double(:in_flight => true)) end
      expect { subject.land(double(:in_flight => true)) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'Should let plane take off and confirm it is no longer in the airport' do
      plane = double(:in_flight => false)
      subject.take_off(plane)
      expect(subject.planes.count).to eq 0
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
  