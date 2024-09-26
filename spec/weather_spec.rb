require 'weather'

describe Weather do
subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'returns stormy when rand <= 2' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq(true)
    end
  
    it 'returns not stormy when rand > 2' do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.stormy?).to eq(false)
    end
  end

end
