require 'plane'

describe Plane do

  describe "Landing Tests:" do
    plane = Plane.new
    airport = Airport.new
    it "responds to the method 'land_plan'" do
      expect(subject).to respond_to(:land_plane)
    end
    it "responds to the method landed?" do
      expect(subject).to respond_to (:landed?)
    end
    it "confirms to ATC that it has landed" do
      airport.land(plane)
      expect(plane.landed?).to eq true
    end
    it "raises an error if asked to land when the plane is already on the ground" do
      plane.landed == true
      expect {plane.land_plane}.to raise_error(RuntimeError, "The plane is already on the ground!")
    end
  end

  describe "Take-Off Tests:" do
    plane = Plane.new
    airport = Airport.new
      it "responds to the method take_off" do
        expect(plane).to respond_to(:take_off)
      end
      it "sets @landed to false following take off" do
        airport.land(plane)
        airport.depart(plane)
        expect(plane.landed).to eq false
      end
      it "responds to the method departed?" do
        expect(subject).to respond_to(:departed?)
      end
      it "raises an error if asked to take-off when the plane is already in the air" do
        expect{plane.take_off}.to raise_error(RuntimeError, "The plane is already in the air!")
      end
  end
end
