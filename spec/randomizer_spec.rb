require 'randomizer'

describe Randomizer, :randomizer do
  describe '#rand_between' do
    it { is_expected.to respond_to(:rand_between).with(2).argument }

    it 'is expected to return a random number between 0 and a value' do
      50.times do
        expect(Randomizer.rand_between(0, 50)).to be_between(0, 50).inclusive
      end
    end

    it 'is expected to return a random number between two values' do
      50.times do
        expect(Randomizer.rand_between(20, 50)).to be_between(20, 50).inclusive
      end
    end
  end
end
