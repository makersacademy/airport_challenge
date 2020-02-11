require 'weather'

describe Weather do
  context 'when stormy' do
    it '#stormy returns true' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect(subject).to be_stormy
    end
  end

  context 'when sunny' do
    it '#stormy returns false' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject).not_to be_stormy
    end
  end

end
