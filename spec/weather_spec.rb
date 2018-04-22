require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns a boolean' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
