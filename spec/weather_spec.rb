require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns true or false for stormy weather' do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end
  end
end
