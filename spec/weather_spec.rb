require_relative '../lib/weather.rb'

describe Weather do
  weather = Weather.new

  describe 'condition' do
    it { is_expected.to respond_to(:change_condition) }
    it 'is either sunny or stormy' do
      expect(weather.condition).to eq('Sunny').or(eq('Stormy'))
    end
    it 'is sunny when instantiated' do
      expect(weather.condition).to eq('Sunny')
    end
    it 'selects a random weather pattern when instructed' do
      dynamic_weather = Weather.new
      dynamic_weather.change_condition
      expect(dynamic_weather.condition).to eq('Sunny').or(eq('Stormy'))
    end
    it 'understands if it is stormy' do
      allow(weather).to receive(:condition) { 'Stormy' }
      expect(weather.stormy?).to eq true
    end
  end
end
