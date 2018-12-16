require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'when not stormy' do
      it 'instructs a plane to land' do
        allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
          it 'raises an error' do
            allow(airport).to receive(:stormy?).and_return false
            20.times do
              airport.land(plane)
            end
            expect { airport.land(plane) }.to raise_error "Airport Full"
          end
       end
    end

    context 'when stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane: Weather stormy"
      end
    end
  end

  context '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    # it 'lets one plane take_off' do
    #   plane = Plane.new
    #   airport.land(plane)
    #   expect(airport.take_off(:plane).to eq plane
    # end
  end


end

# describe Airport do
#   it 'lands one plane' do
#     plane = Plane.new
#     subject.land_plane(plane)
#     expect(subject.land_plane(plane)).to eq plane
#   end
# end
