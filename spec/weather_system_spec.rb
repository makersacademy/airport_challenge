require 'weather_system'

describe WeatherSystem do

  let(:weather_system) { WeatherSystem.new }

  describe '#initialize' do
    it 'contains 4 different weathers: Sunshine, Fine, Overcast, Stormy' do
      expect(weather_system.weather_options).to eq ["Sunshine", "Fine", "Overcast", "Stormy"]
    end
  end

  describe '#rand_num_generator' do
    it 'generates a number between 0 and 3' do
      expect(weather_system.rand_num_generator).to be_between 0, 3
    end
  end

  describe '#weather_selection' do
    it 'it cant set the weather as Sunshine' do
      allow(weather_system).to receive(:rand_num_generator).and_return(0)
      expect(weather_system.weather_output).to eq "Sunshine"
    end

    it 'it cant set the weather as Fine' do
      allow(weather_system).to receive(:rand_num_generator).and_return(1)
      expect(weather_system.weather_output).to eq "Fine"
    end

    it 'it cant set the weather as Overcast' do
      allow(weather_system).to receive(:rand_num_generator).and_return(2)
      expect(weather_system.weather_output).to eq "Overcast"
    end

    it 'it cant set the weather as Stormy' do
      allow(weather_system).to receive(:rand_num_generator).and_return(3)
      expect(weather_system.weather_output).to eq "Stormy"
    end
  end

end
