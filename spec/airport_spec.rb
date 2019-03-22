require 'plane'
require 'airport'

describe Airport do

  describe '#landing planes' do
    it 'accepts planes to land at airport' do
      plane = double(:plane)
      allow(plane).to receive(:landing?).and_return(true)
      subject.land_on_runway(plane)
      expect(subject.planes).to include plane
    end

    it 'only accepts planes that have been told to land' do
      plane = double(:plane)
      allow(plane).to receive(:landing?).and_return(false)
      expect { subject.land_on_runway(plane) }.to raise_error "Plane not told to land"
    end

  end

  describe '#taking off planes' do
    it 'checks plane is gone after take off' do
      plane = double(:plane)
      allow(plane).to receive(:take_off).and_return(true)
      subject.planes << plane
      subject.take_off_from_runway(plane)
      expect(subject.planes).not_to include plane
    end

    it 'only lets planes take off if told to' do
      plane = double(:plane)
      allow(plane).to receive(:take_off).and_return(false)
      expect { subject.take_off_from_runway(plane) }.to raise_error "Plane not told to take off"
    end
  end

  describe '#airport capacity' do
    it 'has a capacity' do
      ap = Airport.new(30)
      plane = double(:plane)
      allow(plane).to receive(:landing?).and_return(true)
      ap.capacity.times { ap.land_on_runway(plane) }
      expect { ap.land_on_runway(plane) }.to raise_error "Airport at capacity"
    end

    it 'has a default capacity if left blank' do
      expect(subject.capacity).to eq 20
    end
  end
end
