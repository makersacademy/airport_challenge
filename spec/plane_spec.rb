require_relative "../lib/plane"

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'can land at an airport' do
      allow(airport).to receive(:condition?) { true }
      expect(plane.land(airport)).to eq @airbourne = false
    end

    it 'raises an error if plane is not airbourne' do
      allow(airport).to receive(:condition?) { true }
      allow(plane).to receive(:airbourne) { false }
      expect { plane.land(airport) }. to raise_error 'Plane not in the air'
    end

    it 'raises an error if plane has already landed' do
      allow(airport).to receive(:condition?) { true }
      plane.land(airport)
      expect { plane.land(airport) }. to raise_error 'Plane not in the air'
    end
  end

  describe '#take_off' do
    it 'plane responds to take_off' do
      expect(plane).to respond_to(:take_off)
    end

    it 'tells the airport that the plane has been released' do
      allow(airport).to receive(:condition?) { true }
      plane.land(airport)
      expect(plane.take_off(airport)).to eq 'Plane has departed the airport'
    end

    it 'error raised if plane airbourne' do
      allow(airport).to receive(:condition?) { true }
      expect { plane.take_off(airport) }. to raise_error 'Plane is airbourne'
    end
  end
end
