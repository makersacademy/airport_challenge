require 'randomizer'

describe Randomizer do
  describe '#rand_between' do
    it { is_expected.to respond_to(:rand_between).with(2).argument }
  end
end
