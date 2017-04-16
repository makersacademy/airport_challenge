require 'weather'
describe 'weather' do
  describe 'stormy' do
    report = Weather.new
    it 'tests response to stormy? method' do
      expect(report).to respond_to :stormy?
    end

    it 'tests if report is stormy' do
      expect(report.stormy?).to be true
    end
  end

  describe 'generate_weather' do
    weather = Weather.new
    it 'tests response to generate_weather method' do
      expect(weather).to respond_to :generate_weather
    end

    it 'tests if generate_weather can create an instance of weather' do
      allow(weather).to receive(:generate_weather) { 0 }
      expect(weather.generate_weather). to eq 0
    end
  end
end
