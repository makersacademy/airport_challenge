require 'weather'
describe Weather do
  it "Has a method called 'stormy?'" do
    expect(subject).to respond_to(:stormy?)
  end
  describe '#stormy?' do
    it 'returns true' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject.stormy?).to eq(true)
    end
    it 'returns false' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.stormy?).to eq(false)
    end
  end
end
