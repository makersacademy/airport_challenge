require 'weather'

describe Weather do
  describe '#stormy?' do
    it {is_expected.to respond_to (:stormy?)}

    # it 'output should be true/false' do
    #   weather_output
    #   100.times {weather_output << subject.stormy?}
    #   weather_output.each do |current_weather|
    #     expect(current_weather).to eq true || false)
    #   end
  end
end
