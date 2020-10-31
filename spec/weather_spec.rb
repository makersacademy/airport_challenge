require 'weather'

describe Weather do
  describe "#current_weather" do
    it "returns a stormy weather state" do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(1)
      expect(weather.current_weather).to eq('stormy')
    end

    it "returns a chill weather state" do
      weather = Weather.new
      allow(weather).to receive(:rand).and_return(2)
      expect(weather.current_weather).to eq('chill')
    end
  end
  
end