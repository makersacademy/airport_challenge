require "weather"

describe Weather do

  subject(:weather) { Weather.new }

  describe "weather_status" do
    it "returns sunny" do
      allow(Kernel).to receive(:rand).and_return(2)
      expect(weather.weather_status).to eq "Sunny"
    end

    it "returns stormy" do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather.weather_status).to eq "Stormy"
    end
  end
end
