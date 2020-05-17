require 'weather'

describe Weather do
  let(:subject) { Weather }

  describe '#generate' do
    it { is_expected.to respond_to :generate }

    it 'is sunny when randomly generated number is 80 or less' do
      allow(subject).to receive(:rand).and_return(80)
      expect(subject.generate).to eq 'sunny'
    end

    it 'is stormy when randomly generated number is over 80' do
      allow(subject).to receive(:rand).and_return(81)
      expect(subject.generate).to eq 'stormy'
    end
  end
end
