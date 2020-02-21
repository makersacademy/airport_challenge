require 'airport'

describe Airport do 
	context "allows plane to land" do
		it { is_expected.to respond_to :plane_land } 
	end
end