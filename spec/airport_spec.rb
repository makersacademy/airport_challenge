# die - do it expect #sort out rspec run error (rubocop)
# need to add fail cases if planes < capacity and weather 
# look at rubric this pm 
require 'airport'

describe Airport do 
  
  let(:plane) { Plane.new }
  subject(:airport) { described_class.new }
  it "airport.new creates a new airport" do
    expect(Airport.new).to be_instance_of Airport
  end 

  it "contains a hanger for planes to be stored (a hanger)" do
    expect(subject.hanger).to eq([]) 
  end  
   
  it "has the ability to accept a plane to land" do 
    expect(subject).to respond_to(:land).with(1).argument 
  end 
  # it "returns the plane (landed in the airport) when the plane has landed" do 
  #  plane = Plane.new 
  #  expect(subject.land(plane)).to eq(plane) 
  # end 
  it "has the ability to instuct  a plane to take off" do 

    expect(subject).to respond_to(:takeoff).with(1).argument 
  end 
  it "shows that plane is no longer in airport, once it has taken off" do 
    allow(airport).to receive(:weather).and_return :sunny
    plane = Plane.new 
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq("plane has taken off!")
    expect(subject.hanger).not_to include(plane) # does running subject.takeoff on the previous line change the state of the hanger? Have not run subject.takeoff? 
  end 

  it "prohibits planes from landing if the weather is stormy" do 
    plane = Plane.new
    allow(subject).to receive(:weather).and_return(:stormy)
    expect { subject.land(plane) } .to raise_error "cannot land it is terrible weather for flying" 
  end

  it "prohibits planes from taking off if the weather is stormy" do 
    plane = Plane.new
    allow(subject).to receive(:weather).and_return(:sunny)
    subject.land(plane)
    allow(subject).to receive(:weather).and_return(:stormy)

    expect { subject.takeoff(plane) } .to raise_error "cannot takeoff it is terrible weather for flying" 
  end
  it "raises an error if a plane that has already landed tried to land " do 
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) } .to raise_error "This plane has already landed"  
  end 
  it "raises an error if plane that is not in hanger tries to take of" do 
    plane = Plane.new
    expect { subject.takeoff(plane) } .to raise_error "This plane cannot take off - not in hanger"  
  end 
  it "raises an error if a 6th plane tries to land (cap +1)" do 
    a = Plane.new
    b = Plane.new
    c = Plane.new
    d = Plane.new
    e = Plane.new
    f = Plane.new
    subject.land(a)
    subject.land(b)
    subject.land(c)
    subject.land(d)
    subject.land(e)
    expect { subject.land(f) } .to raise_error "The hanger is full"
  end 
   
end 

# user story 1 
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport - done

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport - done

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy - done

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy - done
