require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  before(:each) do
    @weather_ary = []
    100.times { @weather_ary.push(weather.report) }
  end

  describe '#report' do
    it 'has clear weather' do
      expect(@weather_ary.include?(:clear)).to eq true
    end
    it 'has stormy weather' do
      expect(@weather_ary.include?(:stormy)).to eq true
    end
  end

end
