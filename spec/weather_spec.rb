require 'weather'

describe Weather do
  subject(:weather_object) { described_class.new }

  context 'is random:' do
    it 'it provides a random weather state' do
      expect([:sunny, :cloudy, :foggy, :stormy, :snowy, :windy, :clear]).to include(weather_object.state)
    end
  end
end
