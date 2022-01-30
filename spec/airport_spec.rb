require 'airport'

describe Airport do
  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :take_off_message}
  
  describe "#land_plane" do
    it "should lane a plane at the airport" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.land_plane(plane)).to eq plane
    end
  end  

  describe "#take_off" do
    it "should let planes leave the airport" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

  describe "#take_off_message" do
  it "should give a confirmation message when they have left" do
    expect(subject.take_off_message).to eq "Plane has left the runway"
  end
  end



end


# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and 
# confirm that it is no longer in the airport
