require 'air_traffic_controller'

describe AirTrafficController do
  subject(:atc) { AirTrafficController.new }
  let(:dummy_plane_flying) { double :dummy_plane_flying, airport: :inflight } 
  let(:dummy_plane_docked) { double :dummy_plane_docked, airport: :heathrow } 
  let(:dummy_airport_heathrow) { double :dummy_airport_heathrow, hangar: [], capacity: 10 } 

  describe ':request_status' do
  
    it "identify that plane is 'in-flight'" do
      expect(atc.request_status(dummy_plane_flying)).to eq(:inflight)
    end

    it "identify that plane is docked at an airport" do
      expect(atc.request_status(dummy_plane_docked)).to eq(:docked)
    end
  end

  describe ':approval' do
  
    it 'raises exception if there is bad weather' do
      expect { atc.approval("Stormy") }.to raise_error(RuntimeError)
    end

  end

  describe ':flight_approval' do
    it 'makes plane aware they have flight approval' do
      dummy_plane = double(:acknowledge_flight_approval => true) 
      expect(atc.flight_approval(dummy_plane, :sunny)).to eq(true) 
    end

  end

  describe ':land_approval' do
    it 'makes plane aware they have landing approval' do
      dummy_plane = double(:acknowledge_land_approval => true) 
      expect(atc.land_approval(dummy_plane, :sunny, dummy_airport_heathrow)).to eq(true) 
    end

  end

end
