require 'weather'

describe Weather do
  describe '#report' do
    it 'reports both clear or stormy' do
      weather_ary = []
      100.times { weather_ary.push(subject.report) }
      expect(weather_ary.include?('clear')).to eq true
      expect(weather_ary.include?('stormy')).to eq true
    end
  end
end
