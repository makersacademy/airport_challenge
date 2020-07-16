require './lib/plane'




describe Plane do
it "instructs plane to take off and cofirm its no longer there" do
plane = Plane.new
expect(plane.take_off("airport")).to eq "Plane is no longer at the airport"
 end
end
