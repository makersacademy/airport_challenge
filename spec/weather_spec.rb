require 'weather'

describe Weather do
  describe '#generate_weather' do
    it 'returns a random number in (1..10)' do
      expect(subject.generate_weather).to be_between(1, 10).inclusive
    end
  end
end
