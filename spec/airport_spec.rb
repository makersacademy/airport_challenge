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

  describe '#request_landing' do
    context 'when airport is not full' do
      it 'approves landing' do
        expect { subject.request_landing }.not_to raise_error
      end
    end

    context 'when airport is full' do
      before(:example) { 50.times { subject.planes << plane } }
      it 'raises error' do
        expect { subject.request_landing }.to raise_error CapacityError, CapacityError.new.msg
      end
    end
  end

  describe '#request_take_off' do
    context 'when plane is in airports' do
      before(:example) { subject.planes << plane }
      it 'approves take_off' do
        expect { subject.request_take_off(plane) }.not_to raise_error
      end
    end

    context 'when plane is not in the airport' do
      it 'raises error' do
        expect { subject.request_take_off(plane) }.to raise_error AirportError, AirportError.new.msg
      end
    end
  end

  describe '#full?' do
    context 'when aiport is full' do
      it 'returns true' do
        51.times { subject.planes << plane }
        expect(subject.send(:full?)).to be true
      end

      it 'returns true when only just full' do
        50.times { subject.planes << plane }
        expect(subject.send(:full?)).to be true
      end
    end

    context 'when airport is not full' do
      it 'returns false' do
        expect(subject.send(:full?)).to be false
      end

      it 'returns false when nearly full' do
        49.times { subject.planes << plane }
        expect(subject.send(:full?)).to be false
      end
    end
  end

  describe '#capacity' do
    context 'when initialized without argument' do
      subject { described_class.new.capacity }
      it { is_expected.to be 50 }
    end

    context 'when intialized with argument 100' do
      subject { described_class.new(100).capacity }
      it { is_expected.to be 100 }
    end

    context 'after intialization' do
      before(:example) { subject.capacity = 500 }
      it 'can still be overridden' do
        expect(subject.capacity).to be 500
      end
    end
  end
end
