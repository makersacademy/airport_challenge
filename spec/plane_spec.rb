require "plane" 

describe Plane do 
	context "confirm plane has taken off" do 
		it { is_expected.to respond_to :taken_off? }
	end

end