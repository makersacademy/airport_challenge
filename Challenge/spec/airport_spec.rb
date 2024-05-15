require 'airport'
require 'weather'


describe Airport do 

  #it {is_expected.to respond_to(:land_plane).with(1).argument} #does this test that the land plane method works.
  let (:plane) {double :plane}
  let (:capacity) {subject.capacity}

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

  describe "#prevent landing" do 
    it "should prevent landing when airport is full" do 
    capacity.times {subject.land_plane(plane)}
    expect {subject.land_plane(plane)}.to raise_error ("Docking station is full")
    end
  end

  describe "#prevent landing" do 
    it "should prevent landing when weather is stormy" do 
    allow(subject.weather).to receive(:stormy?).and_return true
    subject.take_off(plane)
    expect {subject.take_off(plane)}.to raise_error ("Too stormy to land")
    end
  end



end 