require 'weather'

describe Weather do
    it 'responds to random_weather' do
      expect(subject).to respond_to :random_weather
    end

    it 'generates a random number between 0 and 9 when random_weather is called on it' do
      expect(subject.random_weather).to be < 10
      expect(subject.random_weather).to be >= 0
    end

end
