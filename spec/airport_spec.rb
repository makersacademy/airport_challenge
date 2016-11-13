require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
before(:each) do
  @plane = Plane.new
  @weather = Weather.new
end

 context "landing a plane" do
   it "should have a land_plane method" do
     expect(subject).to respond_to(:land_plane).with(1).argument
   end

   it "should check arg given is a plane object" do
     allow(subject).to receive(:land_plane) {@plane}
     expect(subject.land_plane(@plane)).to be_a Plane
   end

   it "should raise error if arg is not a plane" do
     plane = "I'm not a plane"
     expect{ subject.land_plane(plane) }.to raise_error("Only planes can be landed")
   end

   it "should raise error if plane has already been landed" do
     expect{ subject.land_plane(@plane) }.to raise_error("Plane has already landed")
   end

   it "should change landed status to true if it was false" do
     @plane.landed_status = false
     expect{subject.land_plane(@plane)}.to change {@plane.landed_status}.from(false).to(true)
   end

   it "should return message that plane has landed" do
     @plane.landed_status = false
     expect(subject.land_plane(@plane)).to eq "#{@plane} has landed"
   end
 end

 context "checking whether a plane has landed" do
   it "should have a check status method" do
     expect(subject).to respond_to(:has_plane_landed?).with(1).argument
   end

   it "should let user know if a plane has landed" do
     expect(subject.has_plane_landed?(@plane)).to eq "yes"
   end

   it "should let user know if a plane has not landed" do
     @plane.landed_status = false
     expect(subject.has_plane_landed?(@plane)).to eq "no"
   end
 end

 context "allow planes to take off" do
   it "should respond to a take off method" do
     expect(subject).to respond_to(:take_off).with(2).argument
   end

   it "should raise error if plane is still in the air" do
     @plane.landed_status = false
     expect{ subject.take_off(@plane, @weather) }.to raise_error("Plane is still in the air")
   end

   it "taking off should change plane's landed_status to false" do
     expect{subject.take_off(@plane, @weather)}.to change{@plane.landed_status}.from(true).to(false)
   end

   it "should return message to let air controller know that plane has taken off" do
     allow(@weather).to receive(:randomise) {0}
     expect(subject.take_off(@plane, @weather)).to eq "#{@plane} has taken off"
   end
 end

  context "prevent take off when weather is stormy" do
    it "should return message that says weather is set to stormy and doesn't let plane take off" do
      allow(@weather).to receive(:randomise) {1}
      expect(subject.take_off(@plane, @weather)).to eq "Unable to take off because of the stormy weather"
    end

    it "should keep the plane's landed status as true if weather is stormy" do
     allow(@weather).to receive(:randomise) {1}
     subject.take_off(@plane, @weather)
     expect(@plane.landed_status).to eq true
    end
  end

end
