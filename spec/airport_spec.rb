require 'airport'

describe Airport do
  describe ":land_plane method behaviour" do
    it "should respond to the :land_plane method" do
      airport = Airport.new
      expect(airport).to respond_to(:land_plane)
    end
    it "should return a Plane instance when :land_plane is called on an Airport" do
      expect(subject.land_plane).to be_instance_of(Plane)
    end
    it "should raise an error when 11 planes attempt to land" do
      expect { 11.times { subject.land_plane } }.to raise_error("The airport is full")
    end
    it "should allow 10 planes to land without raising an error" do
      expect do 
        10.times { subject.land_plane }
      end.to_not raise_error
    end
  end

  describe ":take_off method behaviour" do
    it "should respond to the :take_off method" do
      expect(subject).to respond_to(:take_off)
    end
    it "should release a plane instance after a plane has landed when it's called" do
      airport = Airport.new
      airport.land_plane
      expect(airport.take_off).to be_instance_of(Plane)
    end
    it "should raise an error if there are no planes within the Airport" do
      expect { subject.take_off }.to raise_error("There are no available planes")
    end
  end
  describe "maximum capacity of the airport Hangar" do
    it "should allow maximum capacity to be set to 20 planes and not raise an error for landing 20 planes" do
      airport = Airport.new(20)
      expect { 20.times { airport.land_plane } }.to_not raise_error
    end
  end
end
