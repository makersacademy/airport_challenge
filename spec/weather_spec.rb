require 'weather'
RSpec.describe Weather do
  describe '#stormy?' do
    it 'is true' do
      allow(Kernel).to receive(:rand).and_return(4)
      expect(subject.stormy?).to eq false
    end
    it 'is false' do
      allow(Kernel).to receive(:rand).and_return(7)
      expect(subject.stormy?).to eq true
    end
  end
end
