require 'airport'

describe Airport do

  let(:plane) { double :plane }
  describe '#land' do
    it 'allows airport to store instance of a plane' do
      expect(subject.land(plane)[0]).to eq(plane)
    end
    it 'allows airport to store multiple planes' do
      subject.land(plane)
      subject.land(plane)
      expect(subject.planes).to_not be_empty
    end
    it 'does not allow planes to land at full airport' do
      airport = Airport.new(1)
      airport.land(plane)
      expect{ airport.land(plane) }.to raise_error "Airport full"
    end
  end

  describe '#take_off' do
    it 'removes plane instance from airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

  describe '#full?' do
    it 'returns true when airport full' do
      airport = Airport.new(1)
      airport.land(plane)
      expect{ airport.full }.to eq(true)
    end
  end
end
