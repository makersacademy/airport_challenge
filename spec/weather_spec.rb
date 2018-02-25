require 'weather'
describe Weather do
  subject(:weather) { described_class.new }
  describe '#stormy?' do
    it "should be stormy when weather_generator is 1" do
      allow(weather).to receive(:weather_generator) { 1 }
      expect(weather.stormy?).to be true
    end
    it "should be sunny when weather_generator is 0" do
      allow(weather).to receive(:weather_generator) { 0 }
      expect(weather.stormy?).to be false
    end
  end
end
