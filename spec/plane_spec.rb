require 'plane'

describe Plane do
  subject(:plane) {Plane.new}



    it "should have a setter method called flying" do
      expect(plane).to respond_to(:flying)
    end
    it "should receive a default argument of true" do
      expect(plane.flying).to eq true
    end
    it "should confirm that plane is no longer flying after landing" do
      plane.land
      expect(plane.flying).to eq false
    end

    it "should confirm that plane is flying after take off" do
      plane.land
      plane.take_off
      expect(plane.flying).to eq true
    end

    it "won't take off if the plane is already flying" do
      plane.land
      plane.take_off
      expect{plane.take_off}.to raise_error("The plane is already flying!")
    end

    it "won't take off if the plane is already flying" do
      plane.land
      expect{plane.land}.to raise_error("The plane has already landed!") 
    end
end
