require 'plane'

describe Plane do
    subject(:plane) { described_class.new}
    # subject(:plane_alt) { described_class.new}
    let(:airport) {double :airport}
    let(:weather) {double :weather}

    describe '#take_off_from(airport)' do
      before do
        allow(airport).to receive(:release)
        allow(weather).to receive(:stormy?)
      end
      it 'should make the plane fly' do
        plane.take_off_from(airport, weather)
        expect(plane.flying?).to eq true
      end
    end

    describe 'when landing' do
      before do
        allow(airport).to receive(:dock)
        allow(weather).to receive(:stormy?).and_return(false)
      end
      it { is_expected.to respond_to(:land_at).with(2).arguments }
      it 'should not be flying after landing' do
        plane.land_at(airport, weather)
        expect(plane.flying?).to eq false
      end
      it 'raises_error if already landed' do
        plane.land_at(airport,weather)
        expect{plane.land_at(airport, weather)}.to raise_error "your plane has already landed"
      end
    end
end
