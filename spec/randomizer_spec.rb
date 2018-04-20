require 'randomizer'

describe Randomizer do
  describe '#rand_between' do
    it { is_expected.to respond_to(:rand_between).with(2).argument }

    it 'is expected to return a random number between two values' do
      50.times do
        expect(Randomizer.rand_between(0, 50)).to be_between(0, 50).inclusive
      end
    end
  end
end
