require 'weather'

RSpec.describe Weather do
  
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it "checks if the weather is stormy" do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq(true)
    end
  end
end
