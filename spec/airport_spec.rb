describe Airport do
  let(:plane) { instance_double(Plane, 'Plane') }

  it { is_expected.to respond_to :planes }

  describe '#planes' do
    subject { described_class.new.planes }

    context 'when initialized' do
      it { is_expected.to be_empty }
      it { is_expected.to be_an_instance_of Array }
    end
  end

  describe '#gone?' do
    context 'when plane is not in airport' do
      subject { described_class.new.gone?(plane) }
      it { is_expected.to be true }
    end

    context 'when plane is in aiport' do
      before(:example) { subject.planes << plane }
      it 'returns false' do
        expect(subject.gone?(plane)).to be false
      end
    end
  end

  describe '#full?' do
    context 'when aiport is full' do
      it 'returns true' do
        21.times { subject.planes << plane }
        expect(subject.send(:full?)).to be true
      end

      it 'returns true when only just full' do
        20.times { subject.planes << plane }
        expect(subject.send(:full?)).to be true
      end
    end

    context 'when airport is not full' do
      it 'returns false' do
        expect(subject.send(:full?)).to be false
      end

      it 'returns false when nearly full' do
        19.times { subject.planes << plane }
        expect(subject.send(:full?)).to be false
      end
    end
  end
end
