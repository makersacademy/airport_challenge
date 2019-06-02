require 'weather'

RSpec.describe Weather do
  describe '#stormy' do
    it 'weather is stormy' do
      expect(subject.stormy?).to eq true
    end

    it 'weather is not stormy' do
      expect(subject.stormy?).to eq false
    end
  end
end

