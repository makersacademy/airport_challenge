# see helper_methods for definitions of helper methods used
describe Plane do
  let(:plane)   { described_class.new }
  let(:planes)  { [] }
  let(:airport) {
    instance_double(
      Airport, 'Airport',
      planes: planes,
      request_landing: nil,
      request_take_off: nil)
  }

  it { is_expected.to respond_to(:land).with 1 }
  it { is_expected.to respond_to(:take_off).with 1 }

  describe '#status' do
    subject { plane.status }
    context 'when initialized' do
      it { is_expected.to be :air }
    end
  end

  describe '#land' do
    before { land_self }

    context 'when airborne' do
      it 'changes status to :ground' do
        expect(subject.status).to be :ground
      end
    end

    context 'when grounded' do
      it 'raises landing error' do
        expect { land_self }.to raise_error LandingError
      end
    end
  end

  describe '#take_off' do
    context 'when grounded' do
      before { land_self; self_take_off }
      it 'changes status to :air' do
        expect(plane.status).to be :air
      end
    end

    context 'when airborne' do
      it 'raises take off error' do
        expect { self_take_off }.to raise_error TakeOffError
      end
    end
  end
end
