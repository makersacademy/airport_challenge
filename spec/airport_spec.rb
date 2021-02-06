describe Airport do
  describe '#planes' do
    subject { described_class.new.planes }
    context 'when initialized' do
      it { is_expected.to be_empty }
      it { is_expected.to be_an_instance_of Array }
    end
  end
end
