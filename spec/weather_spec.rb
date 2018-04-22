require './docs/weather.rb'

describe Weather do
  describe '#stormy?' do
    it "should return true if the weather is stormy" do
      allow(subject).to receive(:random_weather_condition) { :stormy }
      expect(subject.stormy?).to be true
    end
    it "should return false if the weather is sunny" do
      allow(subject).to receive(:random_weather_condition) { :sunny }
      expect(subject.stormy?).to be false
    end
  end
  describe '#random_weather_condition' do
    it 'should choose a weather condition at random' do
      expect([:stormy, :sunny]).to include(subject.random_weather_condition)
    end
  end
end
