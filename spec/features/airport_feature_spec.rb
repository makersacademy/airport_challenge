require_relative '../../lib/airport'

describe 'Feature test 1: planes land and take off from airports' do

  context 'When a plane lands to an airport on a sunny day' do
    it "Changes its status to landed." do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather_status).and_return("sunny")
      l = "landed"
      expect {airport.land(plane)}.to change(plane, :status).from("").to(l)
    end

    it "And it's in the airport." do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather_status).and_return("sunny")
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  context 'When a plane takes off from an airport on a sunny day' do
    it "Changes its status to flying." do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather_status).and_return("sunny")
      airport.land(plane)
      f = "flying"
      l = "landed"
      expect {airport.takeoff(plane)}.to change(plane, :status).from(l).to(f)
    end

    it "And it's no longer in the airport" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:weather_status).and_return("sunny")
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).to eq []
    end
  end

  context "When the weather is stormy planes can't land or take off" do
    it "Denies landing" do
        plane = Plane.new
        airport = Airport.new
        allow(airport).to receive(:weather_status).and_return("stormy")
        error = "Can't land, it's stormy!"
        expect {airport.land(plane)}.to raise_error(error)
    end

    it "Denies take off" do
        plane = Plane.new
        airport = Airport.new
        allow(airport).to receive(:weather_status).and_return("sunny")
        airport.land(plane)
        allow(airport).to receive(:weather_status).and_return("stormy")
        error = "Can't takeoff, it's stormy!"
        expect {airport.takeoff(plane)}.to raise_error(error)
    end
  end

end
