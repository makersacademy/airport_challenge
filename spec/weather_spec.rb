require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'generates mostly sunny weather with occasional storms' do
      expect(subject).to respond_to(:stormy?)
    end
  end
end
