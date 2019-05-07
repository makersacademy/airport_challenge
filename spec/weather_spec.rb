require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'should return true or false' do
      expect([true, false].include?(subject.stormy?)).to eq true
    end
  end
end
