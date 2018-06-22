require 'weather'

describe Weather do
  describe '#isStormy?' do
    it 'can return false' do
      srand(0)
      expect(subject.isStormy?).to be false
    end
    it 'can return true' do
      srand(13) # next call to rand(100) will return 82
      expect(subject.isStormy?).to be true
    end
  end
end
