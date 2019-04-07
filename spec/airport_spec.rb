require 'airport'

describe Airport do
  describe '#stormy?' do
    it 'returns true if weather stormy' do
      allow(subject).to receive(:stormy?) { "stormy" }
      expect(subject).to be_stormy
    end
  end
end
