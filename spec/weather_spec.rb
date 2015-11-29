require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe '#stormy?' do

    it "is expected to be able to return true" do
      allow(weather).to receive(:rand).and_return(1)
      expect(weather.stormy?).to be true
    end

    it 'is expected to be able to return false' do
      allow(weather).to receive(:rand).and_return(0.2)
      expect(weather.stormy?).to be false
    end

  end

end
