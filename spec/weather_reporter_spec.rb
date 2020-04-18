require 'weather_reporter'

describe WeatherReporter do
  it { is_expected.to respond_to(:check_weather) }
  
  describe "#check_weather" do
    it "returns a either 'Sunny' or 'Stormy'" do
      expect(subject.check_weather).to eq("Sunny").or eq("Stormy")
    end
    
    it "returns 'Stormy' when it is stormy" do
      srand(15)
      expect(subject.check_weather).to eq("Stormy")
    end
  end
end