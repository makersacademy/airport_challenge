require 'airport'

describe Airport do
  let(:airplane) { double :aiplane }
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
  describe "land_plane" do
    it "instructs airplane to land" do
      airplane = double(:flying? => true)
      expect(subject.land_plane(airplane)).to eq "Plane successfully landed!"
    end

    it "stops you from landing planes already on land" do 
      airplane = double(:flying? => true)
      subject.land_plane(airplane)
      airplane = double(:flying? => false)
      expect { subject.land_plane(airplane) }.to raise_error "This plane is on the ground!"
    end
  end
  
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "instructs airplane to take off" do
    airplane = double(:flying? => true)
    subject.land_plane(airplane)
    expect(subject.take_off(airplane)).to eq "Plane successfully took off!"
  end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

  # it "prevents airplane from landing if airport is full" do
  #   6.times { subject.land_plane }
  #   expect(subject.land_plane).to eq "Sorry, airport is full!"
  # end

  # it "lets user know airport is empty if there are no planes to takeoff" do
  #   expect(subject.take_off).to eq "There are no airplanes to take off!"
  # end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  # it "Changes airport capacity from standard (5)" do
  #   expect(subject.capacity = 8).to eq 8
  # end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

  # it "Prevents airplane to takeoff if stormy" do
  #   expect(subject.capacity = 8).to eq 8
  # end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
