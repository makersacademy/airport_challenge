require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  
  context 'generates a weather report' do
    before do
      allow(weather).to receive(:rand).with(any_args)
    end

    it 'of Sunny when rand is not 1' do
      expect(weather).to receive(:rand).and_return(6)
      expect(weather.weather_report).to eq("Sunny")
    end

    it 'of Stormy when rand is 1' do
      expect(subject).to receive(:rand).and_return(1)
      expect(weather.weather_report).to eq("Stormy")
    end
  end
end