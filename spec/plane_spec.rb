require 'plane'

describe Plane do
    subject(:plane) { described_class.new}
    # subject(:plane_alt) { described_class.new}
    let(:airport) {double :airport}

    describe '#take_off_from(airport)' do
      before do
        allow(airport).to receive(:release)
      end
      it 'should make the plane fly' do
        plane.take_off_from(airport)
        expect(plane.flying?).to eq true
      end
    end

    describe 'when landing' do
      describe '#land_at' do
        it 'instructs a plane to land' do
          expect(plane).to respond_to(:land_at).with(1).argument
        end
      end
      it 'should not be flying after landing' do
        allow(airport).to receive(:dock)
        plane.land_at(airport)
        expect(plane.flying?).to eq false
      end
    end
end
