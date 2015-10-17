require 'weather'

describe Weather do
  describe '#current' do
    it 'gives weather of sunny or stormy' do
      expect(subject.current).to match /sunny|stormy/
    end
  end
end