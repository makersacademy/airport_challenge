require 'weather'

RSpec.describe Weather do
  
  it { is_expected.to respond_to(:stormy?) }
  
  describe '#stormy?' do

    it "checks if the weather is stormy" do
      weather = Weather.new
      expect(weather).to receive(:rand).and_return(0.09)
      expect(weather.stormy?).to eq(true)
    end
  end
end
