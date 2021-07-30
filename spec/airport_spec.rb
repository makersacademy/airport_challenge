require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @stormy_airport = Airport.new(1, :stormy)
    @plane_on_ground = Plane.new
    @plane_in_flight = Plane.new true
  end

  context 'When it is created' do
    it { is_expected.to have_attributes(:capacity => a_value > 0) }
    it { is_expected.to have_attributes(:weather => Symbol) }
    it { is_expected.to have_attributes(:planes => []) }
    it { is_expected.to respond_to(:clear_for_landing).with(1).argument }
    it { is_expected.to respond_to(:clear_for_takeoff).with(1).argument }
  end

  context 'After it is created' do
    it 'allows planes to land' do
      @airport.clear_for_landing @plane_in_flight
      expect(@airport.planes.last).to eq @plane_in_flight
    end
  
    it 'allows planes to take off' do
      plane = @plane_in_flight
      @airport.clear_for_landing plane
      @airport.clear_for_takeoff plane
      expect(@airport.planes).not_to include plane
    end
  
    it 'only allows planes to land if they are in flight' do
      expect { @airport.clear_for_landing @plane_on_ground }
      .to raise_error 'Plane is not in flight'
    end
  
    it 'only allows planes to take off if they are on the ground' do
      plane = @plane_in_flight
      @airport.clear_for_landing plane
      @airport.clear_for_takeoff plane
  
      expect { @airport.clear_for_takeoff plane }
      .to raise_error 'Plane is already in flight'
    end
  
    it 'only allows planes to take off if they are in the airport' do
      expect { @airport.clear_for_takeoff @plane_on_ground }
      .to raise_error 'Plane not at airport'
    end
  
    it 'prevents planes from landing when at full capacity' do
      full_airport = Airport.new 0
      expect { full_airport.clear_for_landing @plane_in_flight }
      .to raise_error 'Airport at capacity'
    end

    it 'prevents planes from landing in bad weather' do
      expect { @stormy_airport.clear_for_landing @plane_in_flight }
      .to raise_error 'Unsafe landing conditions'
    end
  end
end