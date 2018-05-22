require "plane"

describe WeatherMachine do

  describe "#stormy?" do

    it 'when the weather is stormy it returns true' do
      weathers_double = double(sample: "stormy")
      weather_machine = WeatherMachine.new(weathers_double)
      expect(weather_machine.stormy?).to eq true
    end
    it 'when the weather is sunny it returns false' do
      weathers_double = double(sample: "sunny")
      weather_machine = WeatherMachine.new(weathers_double)
      expect(weather_machine.stormy?).to eq false
    end
  end

end
