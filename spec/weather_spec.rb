require 'weather'

describe Weather do
  it { is_expected.to respond_to(:status) }

  describe '#status' do
    it 'sunny status' do
      allow(subject).to receive(:status) { "sunny" }
      result = subject.status
      expect(result).to eq "sunny"
    end

    it 'stormy status' do
      allow(subject).to receive(:status) { "stormy" }
      result = subject.status
      expect(result).to eq "stormy"
    end
  end
end
