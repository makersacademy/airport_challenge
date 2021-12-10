require 'airport'

describe Airport do
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

  it "instructs airplane to land" do
    expect(subject.land_plane).to eq "Plane successfully landed!"
  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "instructs airplane to take off" do
    expect(subject.take_off).to eq "Plane successfully took off!"
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

  it "instructs airplane to take off" do
    6.times { subject.land_plane }
    expect(subject.land_plane).to eq "Sorry, airport is full!"
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  it "Changes airport capacity from standard (5)" do
    expect(subject.capacity = 8).to eq 8
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
end
