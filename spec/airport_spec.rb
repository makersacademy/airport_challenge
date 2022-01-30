require 'airport'



describe Airport do
  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}
  
  describe "#land_plane" do
    it "should land a plane at the airport" do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end

  end  

  describe "#take_off" do
    it "should let planes leave the airport" do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error "Plane has left airport"
    end
  end

  describe "#airport_capacity" do
    it "should not land a plane if the airport is full" do
      plane = Plane.new
      subject.land_plane(plane)
      expect{subject.land_plane(plane)}.to raise_error "Airport full"
    end
  end
end


# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

