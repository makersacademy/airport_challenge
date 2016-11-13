require 'weather.rb'

describe Weather do

  it {is_expected.to respond_to :stormy}

  # describe '#stormy?' do
  #
  #   it 'returns true if weather is stormy' do
  #     subject.generate_weather(0)
  #     expect(subject.stormy?).to eq true
  #   end
  #
  #   it 'returns false if weather is sunny' do
  #     subject.generate_weather(1)
  #     expect(subject.stormy?).to eq false
  #   end
  #
  # end

  describe '#stormy?' do

    it 'returns true if random_number is 0' do
      expect(subject.stormy?(0)).to eq true
    end

    it 'returns false if random_number is not 0' do
      expect(subject.stormy?(1)).to eq false
      expect(subject.stormy?(2)).to eq false
      expect(subject.stormy?(3)).to eq false
      expect(subject.stormy?(4)).to eq false
    end

  end

  describe '.random_number' do
    #it returns a random integer from 0 to 4
  end

end
