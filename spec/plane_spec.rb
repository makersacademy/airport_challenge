require "plane"
describe Plane do 

	describe "#location" do
		it "should be flying if not in an airport" do
			expect(subject.location).to eq "Flying"
		end
	end
	


end
