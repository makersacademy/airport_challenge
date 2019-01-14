require 'weather'

describe Weather do
  describe '#stormy' do
    it 'can be stormy' do
      expect(subject.stormy?).to be false
    end

    it 'can be not stormy' do
      expect(subject.stormy?).to be false
    end
  end
end
