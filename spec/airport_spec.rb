require 'airport'

describe Airport do 
	# context "allows plane to land" do
it { is_expected.to respond_to(:plane_land).with(1).argument }
it "plane lands" do
	plane = double :plane
	expect(subject.plane_land (plane)).to eq plane
end

context "records that plane has landed" do

it { is_expected.to respond_to :plane }
end

context "allows plane to take off" do
it { is_expected.to respond_to :plane_take_off }
end

end