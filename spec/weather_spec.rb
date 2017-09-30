require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'generates a boolean for deciding weather pattern' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end
end
