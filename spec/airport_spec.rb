require "airport.rb"

describe Airport do

let (:airport) {Airport.new}

  describe "#land" do

      it "responds to land method" do
      expect(airport).to respond_to :land
      end

      it "can land a specified plane" do
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
      end

      it "returns error if plane already landed" do
      plane = Plane.new
      airport.land(plane)
      expect{(airport.land(plane))}.to raise_error("Plane already landed")
      end

      it "returns landed planes" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include(plane)
      end
  end

  describe "#take_off" do

      it "can instruct a landed plane to take_off" do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
      end

      it "returns error if plane is not in airport" do
      plane = Plane.new
      expect{(airport.take_off(plane))}.to raise_error("Plane not in airport")
      end

      it "raises error if weather is stormy" do
      weather = Weather.new
      plane = Plane.new
      airport.land(plane)
      allow(weather).to receive(:change_weather) {:stormy}
      expect{(airport.take_off(plane))}.to raise_error("Plane cannot take off due to stormy weather")
      end
    end

end
