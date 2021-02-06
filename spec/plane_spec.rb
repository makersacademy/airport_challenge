describe Plane do
  let(:plane)   { described_class.new }
  let(:airport) { instance_double(Airport, 'Airport', planes: planes, request_landing: nil, request_take_off: nil) }
  let(:planes)  { [] }

  it { is_expected.to respond_to(:status).with 0 }
  # it { is_expected.to respond_to(:airport).with 0 }
  it { is_expected.to respond_to(:land).with 1 }
  it { is_expected.to respond_to(:take_off).with 1 }

  describe '#status' do
    subject { plane.status }

    context 'when initialized without arguments' do
      it { is_expected.to be :air }
    end
  end
  #
  # describe '#airport' do
  #   context 'when initialized' do
  #     subject { plane.airport }
  #     it { is_expected.to be nil }
  #   end
  #
  #   context 'after landing' do
  #     before(:example) { subject.land(airport) }
  #     subject { plane.airport }
  #     it { is_expected.to be airport }
  #   end
  # end

  describe '#land' do
    context 'when in air' do
      before(:example) { subject.land(airport) }

      it 'changes status to :ground' do
        expect(subject.status).to be :ground
      end

      it 'adds itself to the airport' do
        expect(airport.planes).to include subject
      end

      # it 'updates airport attribute' do
      #   expect(subject.airport).to be airport
      # end
    end
  end

  describe '#take_off' do
    context 'when grounded' do
      before(:example) { subject.land(airport); subject.take_off(airport) }

      it 'changes status to :air' do
        expect(plane.status).to be :air
      end

      it 'removes itself from airport' do
        expect(airport.planes).not_to include subject
      end

      # it 'resets airport attribute to nil' do
      #   expect(subject.airport).to be nil
      # end
    end
  end
end
