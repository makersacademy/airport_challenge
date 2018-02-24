require_relative '../lib/weather'

describe Weather do
  describe '#forecast' do
    it 'tells us it\'s going to be stormy' do
      storm = Weather.new
      expect(storm.forecast).to eq true
    end
  end
end
