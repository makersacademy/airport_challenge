describe Plane do
  describe '#status'
  context 'when initialized' do
    subject { described_class.new.status }
    it { is_expected.to eq :ground }
  end
end
