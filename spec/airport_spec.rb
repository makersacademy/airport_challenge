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
  end

  describe '#take_off' do
    it 'removes plane instance from airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end
end
