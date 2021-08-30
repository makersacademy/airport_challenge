require 'airport'


describe Airport do 

  it {is_expected.to respond_to(:land_plane).with(1).argument} #does this test that the land plane method works.
  let (:plane) {double :plane}

  describe "#land plane" do 
    it "should land a plane" do 
    subject.land_plane(plane)
    expect(subject.planes).to include plane
    end
  end 

  describe "#instructs plane to take off" do 
    it "should tell the plane to take off" do
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
    end
  end



end 