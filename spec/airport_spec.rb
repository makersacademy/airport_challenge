require 'airport'

describe Airport do
  describe 'land plane' do
    it 'air_controller instructs a plane to land at an airport' do
      airport = Airport.new
      plane = 1
      airport.land(plane)
      expect(airport.parking).to include(plane)
    end
  end

  describe 'take off' do
    it 'plane takes off' do
      airport = Airport.new
      plane = 1
      airport.takeoff(plane)
      expect(airport.parking).to eq []
    end
  end

  describe 'prevent landing' do
    it "prevent plane from landing when airport is full" do
      airport = Airport.new
      plane = 1
      airport.land(plane)
      expect{ airport.full? }.to raise_error "airport is full can't land"
    end
  end

  describe 'system designer' do
    it 'software can be used for many different airports' do

    end
  end
end
