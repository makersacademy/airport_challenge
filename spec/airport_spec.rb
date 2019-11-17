require 'airport'
require 'plane'
describe Airport do
  
  it "Airports should have a default capacioty if none is set" do
    london = Airport.new
    expect(london.capacity).to eq 10
  end
  
  it "Should allow to set different capacity than default" do
    london = Airport.new 30
    expect(london.capacity).to eq 30
  end
  
  describe 'create_plane' do
    
    it "should create a plane" do
      expect(subject.create_plane(plane = Plane.new)).to eq plane
    end
    
    it "should creater a plane at airport" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      expect(london.planes).to eq [plane]
    end
    
    it "should not allow to make any more planes if airport is full" do
      expect { (Airport::DEFAULT_CAPACITY + 1).times { subject.create_plane(plane = Plane.new) } }.to raise_error "Airport is full"
    end

    
  end
  
  describe 'land' do
    
    it "should let flying planes to land at airport" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      london.takeoff(plane)
      expect(london.land(plane)).to eq plane
    end
    
    it "should not allow planes to land when airport is full" do
      london = Airport.new
      plane = Plane.new
      (Airport::DEFAULT_CAPACITY).times { london.create_plane(Plane.new) }
      expect { london.land(plane) }.to raise_error "Airport is full"
    end
    
    it "should not allow plane to land if it is already at an airport" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      expect{ london.land(plane) }.to raise_error "This plane is already at airport"
    end
    
  end
  
  describe 'takeoff' do
    
    it "should allow a plane to take off from an airport" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      london.takeoff(plane)
      expect(london.planes).to eq []
    end
    
    it "should confirm that plane has taken off" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      expect(london.takeoff(plane)).to eq "Plane flew away"
    end
    
    it "should give you an error if you are trying to take off a plane that is already flying" do
      london = Airport.new
      london.create_plane(plane = Plane.new)
      london.takeoff(plane)
      expect { london.takeoff(plane) }.to raise_error "This plane is already flying"
    end
    
    it "should give you an error when you are trying to take off a plane that is in a different airport" do
      london = Airport.new
      barcelona = Airport.new
      barcelona.create_plane(plane = Plane.new)
      expect { london.takeoff(plane) }.to raise_error "No such plane in this airport"
    end
  end
  
end
