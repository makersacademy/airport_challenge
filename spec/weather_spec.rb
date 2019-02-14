require 'weather'

RSpec.describe Weather do
  
  it { is_expected.to respond_to(:stormy?) }
  
  describe '#stormy?' do

    it "checks if the weather is stormy" do
      weather = Weather.new
      # allow(weather).to receive(:stormy?).and_return(true)
      expect(weather).to receive(:rand).and_return(0.09)
      expect(weather.stormy?).to eq(true)
    end
  end
end
