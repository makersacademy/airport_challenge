require 'weather'

describe Weather do

  describe '#stormy' do
    it 'tells you whether it\'s stormy' do
      expect(subject.stormy?).to satisfy do |value|
        [true, false].include? value
      end
    end
  end
end
