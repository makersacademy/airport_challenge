require 'airport'

describe Airport do
  describe "#full" do

    it "should raise an error if a plane tries to land when the airport is full" do
      airport = Airport.new(1)
      plane = Plane.new
      plane2 = Plane.new
      plane.land(airport)
      expect { plane2.land(airport) }.to raise_error(StandardError, "airport is full")
    end

  end

  describe "#initialize" do
    
    it "should have a default capacity of 5" do
      expect(subject.capacity).to eql(5)
    end
    
    it "should be able to change the capacity when initialized" do
      airport = Airport.new(30)
      expect(airport.capacity).to eql(30)
    end

  end
  
end
