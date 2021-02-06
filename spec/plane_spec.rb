describe Plane do
  let(:plane)   { described_class.new }
  let(:airport) { instance_double(Airport, 'Airport', planes: planes) }
  let(:planes)  { [] }

  it { is_expected.to respond_to(:status).with 0 }
  it { is_expected.to respond_to(:land).with 1 }
  it { is_expected.to respond_to(:take_off).with 1 }

  describe '#status' do
    subject { plane.status }
    
    context 'when initialized without arguments' do
      it { is_expected.to be :air }
    end
  end

  describe '#land' do
    context 'when in air' do
      before(:example) { subject.land(airport) }

      it 'changes status to :ground' do
        expect(subject.status).to be :ground
      end

      it 'adds itself to the airport' do
        expect(airport.planes).to include(subject)
      end
    end
  end

  describe '#take_off' do
    context 'when grounded' do
      before(:example) { subject.land(airport); subject.take_off(airport) }

      it 'changes status to :air' do
        expect(plane.status).to be :air
      end

      it 'removes itself from airport' do
        expect(airport.planes).not_to include(subject)
      end
    end
  end
end
