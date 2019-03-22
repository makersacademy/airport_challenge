require 'weather'

describe Weather do
  describe '#generate_weather' do

    it 'weather can be stormy or sunny' do
      expect(subject.generate_weather).to eq(true).or eq(false)
    end

    it 'weather can be stormy' do
      expect(subject.generate_weather(1)).to eq(false)
    end
  end

  describe '#initialize' do
    it 'generates a number between 1 and 4 when a new instance is created' do
      expect(subject.number).to eq(1).or eq(2).or eq(3).or eq(4)
    end
  end
end
