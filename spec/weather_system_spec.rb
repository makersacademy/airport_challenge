require 'weather_system'

describe WeatherSystem do

  let(:weather_system) { described_class.new }

  describe '#rand_num_generator' do
    it 'generates a number between 1 and 4' do
      expect(weather_system.rand_num_generator).to be_between 1, 4
    end
  end

  describe '#weather_output' do
    it 'returns the weather as Stormy in rare occasions' do
      allow(weather_system).to receive(:rand_num_generator).and_return(1)
      expect(weather_system.weather_output).to eq 'Stormy'
    end

    it 'returns the weather as Sunshine in most occasions' do
      allow(weather_system).to receive(:rand_num_generator).and_return(2..4)
      expect(weather_system.weather_output).to eq 'Sunshine'
    end
  end

end
