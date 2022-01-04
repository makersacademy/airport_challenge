require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'sometimes returns false' do
      srand(2)
      expect(subject.stormy?).to eq(false)
    end

    it 'sometimes returns true' do
      srand(6)
      expect(subject.stormy?).to eq(true)
    end
  end
end
