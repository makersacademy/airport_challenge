require  'weather'

describe Weather do
  describe '#weather_condition' do
    it 'generates a random weather condition' do
      expect(subject.weather_condition.between?(1, 10)).to eq true
    end
  end
end
