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
      expect(weather_system.rand_num_generator).to be_between 0,3
    end
  end

  describe '#weather_selection' do
    it 'randomly selects the weather' do
      expect(weather_system.weather_selection) # write test...
    end
  end

end
