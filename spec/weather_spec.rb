require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'should return true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
