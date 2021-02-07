# helper methods are defined in ./airport_test_setup_spec.rb
describe Airport do
  let(:plane) { instance_double(Plane, 'Plane') }

  it { is_expected.to respond_to(:capacity).with 0 }
  it { is_expected.to respond_to(:weather).with 0 }
  it { is_expected.to respond_to(:contain?).with 1 }

  describe '#planes' do
    subject { described_class.new.send(:planes) }
    context 'when initialized' do
      it { is_expected.to be_empty }
      it { is_expected.to be_an_instance_of Array }
    end
  end

  describe '#contain?' do
    context 'when plane is not in airport' do
      subject { described_class.new.contain?(plane) }
      it { is_expected.to be false }
    end

    context 'when plane is in aiport' do
      before(:example) { let_there_be_sun; land_one }
      it 'returns true' do
        expect(subject.contain?(plane)).to be true
      end
    end
  end

  describe '#full?' do
    before { let_there_be_sun }

    context 'when aiport is full' do
      before { fill_her_up }
      it 'returns true' do
        expect(subject.send(:full?)).to be true
      end
    end

    context 'when airport is not full' do
      it 'returns false' do
        expect(subject.send(:full?)).to be false
      end

      it 'returns false when nearly full' do
        49.times { land_one }
        expect(subject.send(:full?)).to be false
      end
    end
  end

  describe '#capacity' do
    context 'when initialized without argument' do
      subject { described_class.new.capacity }
      it { is_expected.to be described_class::DEFAULT_CAPACITY }
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

  describe '#weather' do
    it 'returns the current forcast' do
      expect(subject.weather).to be(:sunny) | be(:stormy)
    end
  end
end
