require 'airport'

describe Airport do

  let(:plane) { double :plane }
  describe '#land' do
    it 'allows airport to store instance of a plane' do
      expect(subject.land(plane)[0]).to eq(plane)
    end
  end
end
