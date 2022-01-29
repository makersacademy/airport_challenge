require 'airport'

describe Airport do
  it {is_expected.to respond_to :land_plane}
  # .with(1).argument }
  
  
  describe "#land_plane" do
    it "should lane a plane at the airport" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.land_plane(plane)).to eq plane
    end
  end 

 

end
