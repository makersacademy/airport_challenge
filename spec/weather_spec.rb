require 'weather'

describe Weather do
  let(:weather) { described_class.new }
  let(:airport) { double(:airport) }
  describe '#weather_level' do
    it 'returns a value which is an integer'do
     expect(weather.weather_level).to be_a_kind_of(Integer)
    end
  end
end
