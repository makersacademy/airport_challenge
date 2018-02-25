require 'air_traffic_controller'

describe AirTrafficController do

  let(:dummy_plane_flying) { double :dummy_plane_flying, airport: 'in-flight' } 
  let(:dummy_airport_heathrow) { double :dummy_airport_heathrow, spaces: Array.new(10) } 

  describe ':bad_weather?' do
  
    it 'if weather is sunny return true' do
      expect(subject.bad_weather?("Sunny")).to eq(false)
    end

  end

  describe ':request_status' do
  
    it "identify whether a plane is 'in-flight' or at an airport" do
      expect(subject.request_status(dummy_plane_flying)).to eq('in-flight')
    end

  end

  describe ':approval' do
  
    it 'raises exception if there is bad weather' do
      expect { subject.approval("Stormy") }.to raise_error(RuntimeError)
    end

  end

  describe ':flight_approval' do
    it 'makes plane aware they have flight approval' do
      dummy_plane = double(:flight_approval= => true) 
      expect(subject.flight_approval(dummy_plane, "Sunny")).to eq(true) 
    end

  end

  describe ':land_approval' do
    it 'makes plane aware they have landing approval' do
      dummy_plane = double(:land_approval= => true) 
      expect(subject.land_approval(dummy_plane, "Sunny", dummy_airport_heathrow)).to eq(true) 
    end

  end

end
