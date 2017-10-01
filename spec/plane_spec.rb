require 'plane'
require 'airport'


describe Plane do
  let(:airport) {Airport.new}

  context 'weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    context 'plane is landed' do
      let(:plane) {Plane.new(airport)}
      it 'instructs a plane to take off' do
        expect(plane).to respond_to(:take_off_from_airport).with(1).argument
      end

      it 'confirms that the plane is no longer in the airport' do
        airport.planes << plane
        expect { plane.take_off_from_airport(airport) }.to change { airport.plane_count }.by(-1)
      end

    end

    context 'plane is flying' do
      let(:plane) { Plane.new(nil) }
      it 'instructs a plane to land and increases the planes array by 1' do
        expect { plane.land_at_airport(airport) }.to change { airport.plane_count }.by(1)
      end

      it 'cannot take off and cannot be in an airport' do
        expect { plane.take_off_from_airport(airport) }.to raise_error("flying plane cannot take off and cannot be in an airport")
      end

      it 'prevents landing when the airport is full' do
        5.times do
          Plane.new.land_at_airport(airport)
        end
        expect { plane.land_at_airport(airport) }.to raise_error("plane cannot land because the airport is full")
      end

      it 'so planes land at airports, instruct a plane to land' do
        expect { plane.land_at_airport(airport) }.not_to raise_error
      end

      it 'instructs a plane to land and holds it in the planes array' do
        expect { plane.land_at_airport(airport) }.to change { airport.plane_count }.by(1)
      end

    end
  end

  context 'when weather is bad' do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end
    context 'plane is landed' do
      let(:plane) {Plane.new(airport)}
      it 'prevents take off when weather is stormy' do
        expect { plane.take_off_from_airport(airport) }.to raise_error("plane cannot take off in stormy weather")
      end
    end

    context 'plane is flying' do
      let(:plane) {Plane.new(nil)}
      it 'prevents landing when weather is stormy' do
        expect { plane.land_at_airport(airport) }.to raise_error("plane cannot land in stormy weather")
      end
    end

  end


end
