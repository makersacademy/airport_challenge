require 'weather_generator'

shared_examples_for WeatherGenerator do
  context '-> weather generator selects from approved states' do
    it '--> can either be "sunny" or "stormy"' do
      expect(described_class::WEATHER_STATES).to match_array ["sunny", "stormy"]
    end
  end

  context '-> check_weather' do
    it '--> generates a weather state' do
      subject = described_class.new
      expect(described_class::WEATHER_STATES).to include(subject.check_weather)
    end
  end
end
