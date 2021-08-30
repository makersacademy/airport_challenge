require 'airport'


describe Airport do 

  it {is_expected.to respond_to(:land_plane).with(1).argument}
  let (:plane) {double :plane}

  describe "#land plane" do 
    it "should land a plane" do 
    subject.land_plane(plane)
    expect(subject.planes).to include plane
    end
  end 

  



end 