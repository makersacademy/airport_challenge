require 'plane'

describe Plane do
  let(:dummy_airport) { double :dummy_airport, dock_plane: [], release_plane: [], class: Airport }
  subject(:plane) { Plane.new(dummy_airport) }  

  describe ':initialize' do
     
    it 'initializes airport' do
      expect(plane.airport).to eq(dummy_airport)
    end
      
    it 'assigns flight_approval' do
      expect(plane.flight_approval).to eq(false)
    end

  end

  describe ':take_off' do

    it 'tests if take off sets land approval to false' do
      plane.acknowledge_flight_approval
      plane.instance_variable_set(:@airport, dummy_airport)
      plane.take_off
      expect(plane.land_approval).to eq(false)
    end

    it 'tests if take off sets airport to inflight' do
      plane.acknowledge_flight_approval
      plane.instance_variable_set(:@airport, dummy_airport)
      plane.take_off
      expect(plane.airport).to eq(:inflight)
    end

  end

  describe ':land' do

    it 'tests if land is set to false' do
      plane.acknowledge_land_approval(dummy_airport)
      plane.instance_variable_set(:@airport, :inflight)
      plane.land(dummy_airport)
      expect(plane.flight_approval).to eq(false)
    end

  end

  describe ':acknowledge_flight_approval' do
  
    it 'on approval should be true' do
      plane.acknowledge_flight_approval
      expect(plane.flight_approval).to eq(true)
    end
  end

  describe ':take_off_check' do
    
    it 'if flight approval has not been given raise error' do
      expect { plane.take_off_check }.to raise_error(RuntimeError)
    end

  end

  describe ':landing_check' do
    
    it 'if airport and airport approved for landing are not the same raise error' do
      dummy_airport_other = double(:dock_plane => [])
      plane.acknowledge_land_approval(dummy_airport_other)
      expect { plane.landing_check(dummy_airport) }.to raise_error(RuntimeError)
    end

  end

end
