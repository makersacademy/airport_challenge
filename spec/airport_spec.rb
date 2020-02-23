require 'airport'

describe Airport do 
	# context "allows plane to land" do
it { is_expected.to respond_to(:plane_land).with(1).argument }
it "plane lands" do
	plane = double :plane
	expect(subject.plane_land (plane)).to eq plane
end

# context "records that plane has landed" do

it { is_expected.to respond_to :plane }
it "records - plane landed" do
	plane = double :plane
	subject.plane_land (plane)
	expect(subject.plane).to eq plane
end

describe "#plane_take_off" do 

it "does not allow plane take off in stormy weather conditions" do
	plane = double(:plane, stormy?: true)
	subject.plane_land plane 
	expect { subject.plane_take_off }.to raise_error "Abort: Bad weather conditions!"
end

# it "permits take off in clear weather conditions" do
# 	plane = double(:plane, stormy?: false)
# 	subject.plane_land plane
#  	expect(subject.plane_take_off).to eq plane
# end

end

end