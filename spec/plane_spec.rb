describe Plane do 
	it { is_expected.to respond_to :land }

	it { is_expected.to respond_to :take_off }

	it "raises error if the plane is already flying and is trying to take off " do
		expect { subject.take_off }.to raise_error "Plane is already flying"
	end 
		
end 