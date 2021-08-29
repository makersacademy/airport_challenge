require 'plane'

describe Plane do
  describe '#initialize' do
    it 'is expected to assign :landed to true' do
      plane = Plane.new
      expect(plane.landed).to eq true
    end
  end

  describe '#land' do
    let(:plane) { described_class.new }
    it 'is expected to revert :landed to true if currently false' do
      allow(plane).to receive(:stormy?).and_return(false)
      plane.take_off
      expect(plane.land).to eq 'Plane has landed'
      expect(plane.landed).to eq true
    end

    it 'raises error saying that plane is already landed if :landed is true' do
      expect { plane.land }.to raise_error 'Plane is already grounded!'
    end

    it 'raises error if weather is stormy' do
      allow(plane).to receive(:stormy?).and_return(false)
      plane.take_off
      allow(plane).to receive(:stormy?).and_return(true)
      expect { plane.land }.to raise_error 'Weather is stormy'
    end
  end

  describe '#take_off' do
    let(:plane) { described_class.new }

    it 'is expected to revert :landed to false to emulate a plane taking off' do
      allow(plane).to receive(:stormy?).and_return(false)
      expect(plane.take_off).to eq 'Plane has taken off'
      expect(plane.landed).to eq false
    end

    it 'raises error saying that plane is already flying if :landed is false' do
      allow(plane).to receive(:stormy?).and_return(false)
      plane.take_off
      expect { plane.take_off }.to raise_error 'Plane is already flying!'
    end

    it 'raises an error if weather is stormy' do
      allow(plane).to receive(:stormy?).and_return(true)
      expect { plane.take_off }.to raise_error 'Weather is stormy'
    end
  end

  describe '#stormy?' do
    let(:plane) { described_class.new }

    it 'likely (7/10 chance) to return false' do
      allow(plane).to receive(:rand).and_return(1)
      expect(plane.stormy?).to eq false      
    end

    it 'unlikely (3/10 chance) to return true' do
      allow(plane).to receive(:rand).and_return(8)
      expect(plane.stormy?).to eq true
    end
  end
end
