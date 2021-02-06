describe Plane do
  let(:plane)        { described_class.new }
  let(:ground_plane) { described_class.new }
  let(:airport)      { instance_double(Airport, 'Airport', planes: planes) }
  let(:planes)       { [] }

  it { is_expected.to respond_to :status }
  it { is_expected.to respond_to(:land).with 1 }

  describe '#status' do
    subject { plane.status }
    context 'when initialized without arguments' do
      it { is_expected.to eq :air }
    end
  end

  describe '#land' do
    context 'when in air' do
      before(:example) { plane.land(airport) }
      it 'changes status' do
        expect(plane.status).to be :ground
      end

      it 'adds the plane to the airport' do
        expect(airport.planes).to include(plane)
      end
    end
  end
end
