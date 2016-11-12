require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

 context "landing a plane" do
   it "should have a land_plane method" do
     expect(subject).to respond_to(:land_plane).with(1).argument
   end

   it "should check arg given is a plane object" do
     plane = Plane.new
     allow(subject).to receive(:land_plane) {plane}
     expect(subject.land_plane(plane)).to be_a Plane
   end

   it "should raise error if arg is not a plane" do
     plane = "I'm not a plane"
     expect{ subject.land_plane(plane) }.to raise_error("Only planes can be landed")
   end

   it "should raise error if plane has already been landed" do
     plane = Plane.new
     expect{ subject.land_plane(plane) }.to raise_error("Plane has already landed")
   end

   it "should change landed status to true if it was false" do
     plane = Plane.new
     plane.landed_status = false
     expect{subject.land_plane(plane)}.to change {plane.landed_status}.from(false).to(true)
   end

   it "should return message that plane has landed" do
     plane = Plane.new
     plane.landed_status = false
     expect(subject.land_plane(plane)).to eq "#{plane} has landed"
   end
 end

 context "checking whether a plane has landed" do
   it "should have a check status method" do
     expect(subject).to respond_to(:has_plane_landed?).with(1).argument
   end

   it "should let user know if a plane has landed" do
     plane = Plane.new
     expect(subject.has_plane_landed?(plane)).to eq "yes"
   end

   it "should let user know if a plane has not landed" do
     plane = Plane.new
     plane.landed_status = false
     expect(subject.has_plane_landed?(plane)).to eq "no"
   end
 end

 context "allow planes to take off" do
   it "should respond to a take off method" do
     expect(subject).to respond_to(:take_off).with(1).argument
   end

   it "should not allow planes to take off if their landed_status is false" do
     plane = Plane.new
     plane.landed_status = false
     allow(subject).to receive(:take_off) {false}
     expect(subject.take_off(plane)).to eq false
   end

   it "should raise error if plane is still in the air" do
     plane = Plane.new
     plane.landed_status = false
     expect{ subject.take_off(plane) }.to raise_error("Plane is still in the air")
   end

   it "taking off should change plane's landed_status to false" do
     plane = Plane.new
     expect{subject.take_off(plane)}.to change{plane.landed_status}.from(true).to(false)
   end

   it "should return message to let air controller know that plane has taken off" do
   plane = Plane.new
   expect(subject.take_off(plane)).to eq "#{plane} has taken off"
   end
 end

  context "prevent take off when weather is stormy" do
    it "should"
  end

end
