require "plane.rb"

describe Plane do

  describe "#land_at" do
    it "raises error if plane landed at other airport already" do
      airport1 = Airport.new(airport1)
      airport2 = Airport.new(airport2)
      subject.land_at(airport1)
      
      expect { subject.land_at(airport2) }.to raise_error ("Plane already landed at another airport")
    end 
  end
end