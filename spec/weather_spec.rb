require 'weather'

describe Weather do
  describe "#current_weather" do
    it "generates a random weather state" do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(1)
      expect(weather.current_weather).to eq('stormy')
    end
  end
  
end