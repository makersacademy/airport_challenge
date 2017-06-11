require 'Plane.rb'

describe Plane do

	it { is_expected.to respond_to(:status) }	
	it { is_expected.to respond_to(:land) }	
	it { is_expected.to respond_to(:take_off) }	
	it "can land" do
		expect(subject.land.status).to eq "Landed"
	end 

	it "can take off" do
		expect(subject.take_off.status).to eq "Flying"
	end

end 
