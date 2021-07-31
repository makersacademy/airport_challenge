require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @airport = Airport.new(1, :clear)
    @stormy_airport = Airport.new(1, :stormy, [Plane.new])
    @plane_on_ground = Plane.new
    @plane_in_flight = Plane.new true
  end

  context 'when it is created' do
    it { is_expected.to have_attributes(:capacity => a_value > 0) }
    it { is_expected.to have_attributes(:weather => Symbol) }
    it { is_expected.to have_attributes(:planes => []) }
    it { is_expected.to respond_to(:receive).with(1).argument }
    it { is_expected.to respond_to(:release).with(1).argument }
    it { is_expected.to respond_to(:capacity=) }
  end

  context 'during operation' do
    it 'allows planes to land' do
      @airport.receive @plane_in_flight

      expect(@airport.planes.last).to eq @plane_in_flight
    end
  
    it 'allows planes to take off' do
      plane = @plane_in_flight

      @airport.receive plane
      @airport.release plane

      expect(@airport.planes).not_to include plane
    end

    it 'allows only planes to land' do
      pterodactyl = double()

      allow(pterodactyl).to receive(:in_flight?) { true }
      allow(pterodactyl).to receive(:land)

      expect { @airport.receive pterodactyl }
      .to raise_error 'Only planes are allowed to land'
    end
  
    it 'only allows planes to land if they are in flight' do
      expect { @airport.receive @plane_on_ground }
      .to raise_error 'Plane is not in flight'
    end
  
    it 'only allows planes to take off if they are on the ground' do
      plane = @plane_in_flight

      @airport.receive plane
      @airport.release plane
  
      expect { @airport.release plane }
      .to raise_error 'Plane is already in flight'
    end
  
    it 'only allows planes to take off if they are in the airport' do
      expect { @airport.release @plane_on_ground }
      .to raise_error 'Plane not at airport'
    end
  
    it 'prevents planes from landing when at full capacity' do
      full_airport = Airport.new(0, :clear)

      expect { full_airport.receive @plane_in_flight }
      .to raise_error 'Airport at capacity'
    end

    it 'prevents planes from landing in bad weather' do
      expect { @stormy_airport.receive @plane_in_flight }
      .to raise_error 'Unsafe landing conditions'
    end

    it 'prevents planes from taking off in bad weather' do
      grounded_plane = @stormy_airport.planes.first

      expect { @stormy_airport.release grounded_plane }
      .to raise_error 'Unsafe takeoff conditions'
    end
  end
end
