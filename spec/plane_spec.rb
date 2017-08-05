require 'plane'


describe Plane  do

 it "Has @airborne variable" do
   expect(subject).to respond_to :airborne
 end

 it 'Sets @airborne to true by default' do
   expect(subject.airborne).to eq true
 end

 it "returns 'false' when #ground_plane is called on a plane" do
   expect(subject.ground_plane).to eq false
 end

  describe "#airborne" do

   it "returns true if @airborne is true" do
     expect(subject.airborne?).to eq true
   end

   it "returns false if plane is grounded" do
     subject.ground_plane
     expect(subject.airborne?).to eq false
   end

  end

end
