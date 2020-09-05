require "plane"

describe Plane do 
	it { is_expected.to respond_to :land }

	it { is_expected.to respond_to :take_off }

	it "raises error if the plane is already flying and is trying to take off " do
		expect { subject.take_off }.to raise_error "Plane is already flying"

	end 
		
	it "raises error if the plane is trying to land and has already landed" do
		plane = Plane.new 
		plane.land
		expect { plane.land }.to raise_error "Plane has already landed"
	end 
end 