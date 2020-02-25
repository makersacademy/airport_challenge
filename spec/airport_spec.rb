require 'airport.rb'
require 'plane.rb'


describe Airport do

	describe Airport do 
		context "Landing" do
			it "completes landing" do
				expect(subject.land[0]).to be_a(Plane)
			end
		end

		context "Takeoff" do
			it "completes takeoff" do
				expect(subject.takeoff).to be_a_kind_of(Plane)
			end
		end
	end
end