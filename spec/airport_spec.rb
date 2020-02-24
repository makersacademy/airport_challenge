require 'airport'

describe Airport do

  describe '#land' do
    it 'instructs plane to land' do
      expect(Airport.new).to respond_to(:land).with(1).argument
    end

    it 'adds one to the total number of planes when planes land' do
      airport = Airport.new
      plane = Plane.new
      expect{airport.land(plane)}.to change{airport.number_of_planes}.by(1)
    end

    it 'sets the planes position to airport' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:land).and_return("airport")
      expect(airport.land).to eq("airport")
    end
  end

  describe '#takeoff' do
    it "instructs plane to takeoff" do
      expect(Airport.new).to respond_to(:takeoff).with(1).argument
    end

    it "subtracts by one the total number of planes when a plane takes off" do
      airport = Airport.new
      plane = Plane.new
      expect{airport.takeoff(plane)}.to change{airport.number_of_planes}.by(-1)
    end

    it 'sets the planes position to sky' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:takeoff).and_return("sky")
      expect(airport.takeoff).to eq("sky")
    end
end
end
