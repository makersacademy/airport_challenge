require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  describe '#land' do
   context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

    context 'when airport is full' do
      it 'raises an error' do
        10.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Airport is full, cannot land'
      end
    end
  end

  context 'when stormy' do
    it 'raises an error' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Weather is stormy cannot land a plane'
    end
  end
 end

describe '#take_off' do
  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'returns the plane that took off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane 
    end

    it 'raises an error if plane is not at this airport' do
      airport2 = described_class.new(10)
      airport2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane is not at this airport"
    end
  end

  context 'when stormy' do
    it 'raises an error' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Weather is stormy planes cannot take off'
    end
  end
 end
end
