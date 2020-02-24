require 'airport.rb'
require 'plane.rb'

describe Airport do 
	context "Landing the plane at an airport" do
		it "lands a plane at the airport" do
			plane = Plane.new
			expect{subject.land(plane)}.not_to raise_error
			expect(subject.land(plane)).to eq("Landed")
			expect(subject.land(plane)).to respond_to{:@@hanger}

		end
	end
end