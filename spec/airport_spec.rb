require './docs/airport.rb'

describe Airport do

	describe "#initialize" do
		it "has a default setting of empty (no planes)" do
			expect(subject.planes).to eq []
		end
	end

	describe "#land" do
		it "will record that a plane is at airport if land method is called" do
			plane = Plane.new
	  	expect(subject.land(plane)).to eq([plane])
		end
		context "when airport is full" do
			it "should raise an error" do
	       Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
	       expect{subject.land(Plane.new)}.to raise_error("Airport full!")
	      end
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
		context "when weather is calm" do
		it "will record that a plane has taken off" do
				plane = Plane.new
				subject.land(plane)
				allow(subject).to receive(:unsafe_to_fly?).and_return(false)
				subject.take_off(plane)
				expect(subject.planes).not_to include(plane)
			end
		end
			context "when weather is stormy" do
				it "should raise an error to prevent take off" do
		       plane = Plane.new
					 subject.land(plane)
					 allow(subject).to receive(:unsafe_to_fly?).and_return(true)
		       expect{ subject.take_off(plane) }.to raise_error("Stormy!")
		      end
		    end
		end

	describe "#confirm_take_off" do
		it "will confirm that the list of planes at the airport does not include those that have taken off" do
			plane = Plane.new
			subject.land(plane)
			allow(subject).to receive(:unsafe_to_fly?).and_return(false)
			subject.take_off(plane)
			expect(subject.planes).not_to include(plane)
		end
	end

	describe "#unsafe_to_fly?" do
		it "will return true or false based on the state of weather" do
			subject.weather = "calm"
			expect(subject.unsafe_to_fly?).to eq(false)
		end
	end

end
