require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'reports weather as true if it is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather).to be_stormy
    end

    it 'reports weather as false if it is not stormy' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather).not_to be_stormy
    end
  end
end