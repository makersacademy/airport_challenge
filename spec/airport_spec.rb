require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}
  let(:plane_alt) {double :plane_alt}

    describe '#dock' do
      it 'instructs a plane to dock' do
        expect(airport).to receive(:dock)
        airport.dock(plane)
      end
      it 'should add a plane to the airport' do
        airport.dock(plane)
        expect(airport.planes).to include plane
      end
    end

    describe '#check_for_landed(plane)' do
      it 'should confirm true if a plane has landed' do
        airport.dock(plane)
        expect(airport.check_for_landed(plane)).to eq true
      end
      it 'should confirm false if a plane is not at airport' do
        expect(airport.check_for_landed(plane)).to eq false
      end
      it 'confirms if a specific plane is at the airport' do
        airport.dock(plane)
        airport.dock(plane_alt)
        expect(airport.check_for_landed(plane)).to eq true
        expect(airport.check_for_landed(plane_alt)).to eq true
        airport.release(plane_alt)
        expect(airport.check_for_landed(plane)).to eq true
        expect(airport.check_for_landed(plane_alt)).to eq false
      end
    end
end
