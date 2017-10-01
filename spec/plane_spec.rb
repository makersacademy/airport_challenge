require 'plane'
require 'airport'


describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  context 'weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    it 'so planes land at airports, instruct a plane to land' do
      expect { plane.land_at_airport(airport) }.not_to raise_error
    end

    it 'instructs a plane to land and holds it in the planes array' do
      expect { plane.land_at_airport(airport) }.to change { airport.plane_count }.by(1)
    end

  end



end
