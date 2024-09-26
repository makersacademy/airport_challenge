require 'weather.rb'

describe Weather do
  describe '#forecast' do
    it { is_expected.to respond_to(:forecast) }

    it 'should return a random number to an instance variable' do
      weather = Weather.new
      weather.forecast
      expect(weather.storm).to be_instance_of Integer
    end
  end
end
