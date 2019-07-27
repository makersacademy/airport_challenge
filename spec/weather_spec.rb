require 'weather'

describe Weather do

  it { is_expected.to respond_to :stormy? }

  describe "#stormy?" do
    it "should return true roughly 20% of the time by default" do
      weather_tests = []
      1000.times { weather_tests << subject.stormy? }
      expect(weather_tests.count(true)).to be_within(50).of(200)
    end

    it "should allow for different probabilities of weather" do
      test_magnitude = 10**6
      storm_probability = 0.02
      weather = Weather.new(storm_probability)
      weather_tests = []
      test_magnitude.times { weather_tests << weather.stormy? }
      expect(weather_tests.count(true)).to be_within((storm_probability * test_magnitude) / 4).of(storm_probability * test_magnitude)
    end
  end
end
