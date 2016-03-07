require 'weather'

describe Weather do
  let(:weather) {Weather.new}
  let(:possible_weathers) {proc {|wea| wea == :stormy || wea == :sunny}}

  describe 'current weather access:' do

    it 'can show the current weather' do
      expect(weather.current_weather).to satisfy {possible_weathers}
    end

  end

  describe 'weather changing:' do

    it 'calls the random generator for new weather' do
      expect(weather).to receive :roll_new_weather
      weather.change_weather
    end

    it 'can change the weather to a valid random value' do
      weather.change_weather
      expect(weather.current_weather).to satisfy {possible_weathers}
    end

    it 'can change the weather to a given value' do
      weather.change_weather :dummy_condition
      expect(weather.current_weather).to eq :dummy_condition
    end

  end

end
