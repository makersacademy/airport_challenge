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
    subject.land_plane(plane)
    expect(subject.launch_plane(plane)).to eq "Plane took off"
  end

  it "prevents landing a plane when the airport is full" do 
    subject.capacity.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error "No space available at the airport"
  end 

  it "allows to set up capacity of the airport" do 
    subject = Airport.new(15)
    expect(subject.capacity).to eq 15
  end

  it "prevents a plane from taking off if it is not landed at current airport" do 
    expect { subject.launch_plane(Plane.new) }.to raise_error "Cannot launch the plane because it is not at this airport"
  end 

  it "prevents launch plane when weather is stormy" do 
    # allow(subject).to receive(:check_weather) { "Stormy" }
    fake_weather_station = double("weather_station")
    allow(fake_weather_station).to receive(:check_weather) { "Stormy" }
    subject = Airport.new(15, fake_weather_station)
    plane = Plane.new
    subject.land_plane(plane)
    expect { subject.launch_plane(plane) }.to raise_error "Cannot launch the plane, bad weather"
  end 

end 
