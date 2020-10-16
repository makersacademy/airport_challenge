require 'weather'

describe Weather do
  describe '#stormy' do
    it 'returns true if weather is randomly set to stormy' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy).to eq true
    end

    it 'returns false if weather is not randomly set to stormy' do
      allow(subject).to receive(:rand).and_return(8)
      expect(subject.stormy).to eq false
    end
  end
end
