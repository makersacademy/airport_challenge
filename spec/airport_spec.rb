require 'airport'

describe Airport do 
	context "allows plane to land" do
		it { is_expected.to respond_to :plane_land } 
	end

	context "allows plane to take off" do
		it { is_expected.to respond_to :plane_take_off }
	end

end