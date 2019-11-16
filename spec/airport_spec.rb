require 'airport'
require 'plane'
describe Airport do
  
  it "should have a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq 10
  end
  
  it "should be possible to initialize with different capacities" do
    airport = Airport.new 30
    expect(airport.capacity).to eq 30
  end
  
  describe 'land' do
    
    it "should raise and error when trying to land a plane thats already docked in some airport" do
      london = Airport.new
      barcelona = Airport.new
      plane1 = Plane.new
      london.land(plane1)
      expect{ barcelona.land(plane1) }.to raise_error "This plane already landed somewhere"
    end
    
    it "should prevent landing at full airport" do
      expect { (Airport::DEFAULT_CAPACITY + 1).times { subject.land(Plane.new) } }.to raise_error "Airport is full"
    end
    
    it "should let the plane land if there is space" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end 
  end
  
  describe 'takeoff' do
    
    it "should raise an error when trying to take off with a plane thats already flying" do
      london = Airport.new
      plane1 = Plane.new
      london.land(plane1)
      london.takeoff(plane1)
      expect { london.takeoff(plane1) }.to raise_error "This plane is already flying"
    end
    
    it "should raise an error when trying to take of with a plane that is not docked in this airport" do
      london = Airport.new
      plane1 = Plane.new
      expect { london.takeoff(plane1) }.to raise_error "No such plane in this airport"
    end
    
    it "should let the plane to take off and confirm its gone" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq "Plane flew away"
    end
    
    it "its checking if the plane is flying" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.flying_planes).to eq [plane]
    end
    
  end
end
