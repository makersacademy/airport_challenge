require "plane"
describe Plane do 
	let :airport {double(:airport)}
	describe "#location" do
		it "should be flying if not in an airport" do
			expect(subject.location).to eq "Flying"
		end

		it "should return an airport if in one" do
			subject.land airport
			expect(subject.location).to eq airport
		end
	end
	


end
