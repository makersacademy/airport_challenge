require 'weather'

describe Weather do

  describe '#condition' do

    it 'has a condition attribute' do
      expect(subject).to respond_to :condition
    end

    it 'returns :sunny if it is sunny' do
      subject.condition=(:sunny)
      expect(subject.condition).to eq :sunny
    end

    it 'returns :stormy if it is stormy' do
      subject.condition=(:stormy)
      expect(subject.condition).to eq :stormy
    end

  end

  describe '#random_weather_generator' do
    it 'generates a random number that is less than 10' do
      expect(subject.get_random_number).to be <=10
    end

    it 'generates a random number that is greater than or equal to 1' do
      expect(subject.get_random_number).to be >= 1
    end

    it 'sets the weather to stormy if the random number is >= 7' do
      subject.get_weather(7)
      expect(subject.condition).to eq :stormy
    end

    it 'sets the weather to sunny if the random number is < 7' do
      subject.get_weather(6)
      expect(subject.condition).to eq :sunny
    end

    it 'initializes a Weather object with random conditions' do
      expect(subject.condition).to be_kind_of Symbol
    end

  end

end
