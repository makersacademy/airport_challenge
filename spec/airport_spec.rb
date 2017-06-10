require './docs/airport.rb'

describe Airport do

	describe "#land" do
		it "will record that a plane is at airport if land method is called" do
			plane = Plane.new
	  	expect(subject.land(plane)).to eq([plane])
		end
	end

	describe "#confirm_land" do
		it "will confirm if a plane has landed" do
			plane = Plane.new
			subject.land(plane)
			expect(subject.confirm_land(plane)).to eq(true)
		end
	end

	describe "#take_off" do
		it "will record that a plane has taken off when the take off method is called" do
			plane = Plane.new
			subject.land(plane)
			subject.take_off(plane)
			expect(subject.planes).not_to include(plane)
  	end
	end

	describe "#confirm_take_off" do
		it "will confirm that the list of planes at the airport does not include those that have taken off" do
			plane = Plane.new
			subject.land(plane)
			subject.take_off(plane)
			expect(subject.planes).not_to include(plane)
		end
	end

	describe "#initialize" do
		it "has a default setting of empty (no planes)" do
			expect(subject.planes).to eq []
		end
	end
end
