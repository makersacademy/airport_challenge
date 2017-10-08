require 'airport'
require 'plane'

describe Airport do

  let(:airport) { described_class.new }
  let(:flying_plane) { Plane.new }
  let(:landed_plane) { Plane.new(airport) }

  context 'when weather is good' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    it 'cannot land if it is not flying and must be in an airport' do
      expect { airport.receive_plane(landed_plane)}.to raise_error(LandingError, "This plane has already landed")
    end

    it 'has a default capacity which can be changed as appropriate' do
      airport.capacity = 10
      expect(airport.capacity).to eq(10)
    end

    it 'instructs a plane to land and increases the planes array by 1' do
      expect { airport.receive_plane(flying_plane) }.to change { airport.plane_count }.by(1)
    end

    it 'prevents landing when the airport is full' do
      5.times do
        airport.receive_plane(Plane.new)
      end

      expect { airport.receive_plane(flying_plane) }.to raise_error(LandingError, "plane cannot land because the airport is full")
    end

    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.receive_plane(flying_plane) }.not_to raise_error
    end


      it 'confirms that the plane is no longer in the airport' do
        airport.planes << landed_plane
        expect { airport.request_take_off(landed_plane) }.to change { airport.plane_count }.by(-1)
      end

        it 'cannot take off and cannot be in an airport' do
          expect { airport.request_take_off(flying_plane) }.to raise_error("flying plane cannot take off and cannot be in an airport")
        end

  end

    context 'when weather is bad' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      context 'plane is landed' do

        # it 'prevents take off when weather is stormy' do
        #   expect { airport. }.to raise_error("plane cannot take off in stormy weather")
        # end
      end

      context 'plane is flying' do
        it 'prevents landing when weather is stormy' do
          expect { airport.receive_plane(flying_plane) }.to raise_error("plane cannot land in stormy weather")
        end
      end



    end


end
