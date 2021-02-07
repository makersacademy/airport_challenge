require "airport"
require "plane"

describe Airport do 

  it "lands a plane at an airport" do 
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
  
  it "instructs a plane to take off from an airport" do 
    expect(subject).to respond_to(:launch_plane).with(1).argument
  end 

  it "confirms that plane is no longer in the airport" do 
    plane = Plane.new
    expect(subject.launch_plane(plane)).to eq "Plane took off"
  end

  it "prevents landing a plane when the airport is full" do 
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error "No space available at the airport"
  end 

end 
