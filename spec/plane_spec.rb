require 'plane'
require 'airport'

describe Plane do
  let(:airport) {Airport.new}
  let(:landed_plane) {Plane.new(airport)}
  let(:flying_plane) { Plane.new(nil) }

  context 'weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    describe '#landed' do
      it 'lands the plane' do
        expect(flying_plane.landed(airport)).to eq(airport)
      end
    end

    describe '#take_off_from_airport' do
      it 'takes the plane off from the airport' do
        expect(landed_plane.take_off_from_airport).to eq(nil)
      end
    end

  end

end
