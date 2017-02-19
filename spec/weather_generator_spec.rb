require 'weather_generator'

describe WeatherGenerator do
  subject(:weather_generator) { described_class.new }
  describe "#generate_random_weather" do
    it "responds to generate" do
      expect(weather_generator).to respond_to(:generate_random_weather)
    end
    it "responds to generate with 1 when probability of a storm is 0" do
      expect(weather_generator.generate_random_weather(0)).to eq 1
    end
    it "responds to generate with 0 when probability of a storm is 100" do
      expect(weather_generator.generate_random_weather(100)).to eq 0
    end
    it "raises an error if passed a storm probability >100" do
      expect{weather_generator.generate_random_weather(101)}.to raise_error("Invalid storm probability.")
    end
    it "raises an error if passed a storm probability <0" do
      expect{weather_generator.generate_random_weather(-1)}.to raise_error("Invalid storm probability.")
    end

  end

end
