require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
 
  describe '#land(plane)' do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "can store the landed plane in the airport" do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.land(plane)).to include plane
    end
    
    it 'raises an error when the airport is at full capacity' do
      allow(airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
    
    context 'when weather is stormy' do
      it 'does not allow plane to land ' do
        allow(airport).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error("Weather too bad to land plane")
      end
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off)}

    context 'when weather is stormy' do
      it 'does not allow plane to take off' do
        allow(airport).to receive(:stormy?).and_return true
        expect { subject.take_off }.to raise_error("Weather too bad to take off")
      end
    end
  end

end