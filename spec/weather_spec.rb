require 'weather'

RSpec.describe Weather do

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it "is stormy?" do
      weather = Weather.new
      allow(weather).to receive(:stormy).and_return(false)
      expect(weather.stormy?).to eq(false)
    end
  end
end
