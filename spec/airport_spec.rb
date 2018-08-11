require 'airport'
# Specs for testing the Airport class object
describe Airport do

# Specs to test the class object attributes
  describe "Initialize - Airport instance attributes" do
    it "@hangar - will store planes in an array - initialized empty" do
      expect(subject.hangar).to eq([])
    end
    it "@capacity - will record the capacity of the airport" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it "#initialize - with 1 argument for capacity" do
      airport = Airport.new(20)
      20.times { airport.land_plane(Plane.new) }
      expect { airport.land_plane(Plane.new) }.to raise_error "Hangar Full!!!"
    end


  end


# Specs to test the land_plane method
  describe "#land_plane" do
    it ".land_plane - Airport responds to method with 1 argument" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
    it ".land_plane - returns a Plane object in an array" do
      plane = Plane.new # here we need to think about mocking
      expect(subject.land_plane(Plane)).to eq([Plane])
    end
    it ".land_plane - gives error if there is already a plane in hangar" do
      plane = Plane.new
      expect { 2.times{ subject.land_plane(plane) }  } .to raise_error("Hangar Full!!!")
    end

  end

# Specs to test the take_off method
  describe "#take_off" do
    it ".take_off - Airport responds to this method" do
      expect(subject).to respond_to(:take_off)
    end
    it ".take_off - method returns a plane object" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq(plane)
    end
    it ".take_off - method returns error if there are no planes to take off" do
      expect { subject.take_off }.to raise_error("No planes on the ground!")
    end
  end









end
