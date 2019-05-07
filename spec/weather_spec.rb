require 'weather'

describe Weather do
  let(:weather) {Weather.new}

  describe '#Weather Generation' do
    # Test generate weather method to return status
    it 'Test generate weather method to return either stormy or sunny' do
      expect(weather.generate_weather).to eq("stormy").or eq("sunny")
    end

    it 'Test predicate method for weather' do
      weather.generate_weather
      weather.status = "stormy"
      expect(weather.stormy?).to eq(true)
    end

  end

end
