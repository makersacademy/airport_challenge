require 'weather'

module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end


describe Weather do
  describe '#stormy?' do
    it {is_expected.to respond_to (:stormy?)}

    it 'output should be true/false' do
       weather_output = Array.new
      1000.times {weather_output << subject.stormy?}
      weather_output.each do |current_weather|
        expect(current_weather.is_a?(Boolean)).to eq true
      end
    end
  end
end
