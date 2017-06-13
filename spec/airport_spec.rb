require './docs/airport.rb'

describe Airport do
	let(:plane) {described_class.new}

	describe "#initialize" do
		it "has a default setting of empty (no planes)" do
			expect(subject.planes).to eq []
		end
	end

	describe "#land" do
		context "when weather is calm" do
			it "will record that a plane is at airport if land method is called in calm weather" do
				allow(subject).to receive(:unsafe_to_fly?).and_return(false)
	  		expect(subject.land(plane)).to eq([plane])
			end
		end
		context "when airport is full" do
			it "should raise an error" do
				 allow(subject).to receive(:unsafe_to_fly?).and_return(false)
	       Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
	       expect{subject.land(Plane.new)}.to raise_error("Airport full!")
	      end
	    end
			context "when weather is stormy" do
				it "should raise an error to prevent landing" do
			   	allow(subject).to receive(:unsafe_to_fly?).and_return(true)
			   	expect{ subject.land(plane) }.to raise_error("Too stormy to land!")
			  end
			end
			context "when plane is already at airport" do
				it "should raise an error to prevent second landing" do
			   	allow(subject).to receive(:unsafe_to_fly?).and_return(false)
					subject.land(plane)
			   	expect{ subject.land(plane) }.to raise_error("Plane already at the airport!")
			  end
			end
	end

	describe "#confirm_land" do
		before do
			allow(subject).to receive(:unsafe_to_fly?).and_return(false)
			subject.land(plane)
		end
		it "will confirm if a plane has landed" do
			expect(subject.confirm_land(plane)).to eq(true)
		end
	end

	describe "#take_off" do
		context "when weather is calm" do
		it "will record that a plane has taken off" do
				allow(subject).to receive(:unsafe_to_fly?).and_return(false)
				subject.land(plane)
				allow(subject).to receive(:unsafe_to_fly?).and_return(false)
				subject.take_off(plane)
				expect(subject.planes).not_to include(plane)
			end
		end
			context "when weather is stormy" do
				it "should raise an error to prevent take off" do
					 allow(subject).to receive(:unsafe_to_fly?).and_return(false)
					 subject.land(plane)
					 allow(subject).to receive(:unsafe_to_fly?).and_return(true)
		       expect{ subject.take_off(plane) }.to raise_error("Too stormy to take off!")
		      end
		    end
				context "When plane is not at airport" do
				it "raises an error to prevent take off" do
		 			expect{subject.take_off(plane)}.to raise_error("Plane not found!")
	 			end
			end
		end

	describe "#confirm_take_off" do
		it "will confirm that the list of planes at the airport does not include those that have taken off" do
			allow(subject).to receive(:unsafe_to_fly?).and_return(false)
			subject.land(plane)
			allow(subject).to receive(:unsafe_to_fly?).and_return(false)
			subject.take_off(plane)
			expect(subject.planes).not_to include(plane)
		end
	end

	describe "#unsafe_to_fly?" do
		context "when weather is stormy" do
			it "will return true" do
				allow(Weather).to receive_message_chain(:new, :weather_type).and_return("stormy")
				expect(subject.unsafe_to_fly?).to eq(true)
			end
		end
		context "when weather is calm" do
			it "will return false" do
				allow(Weather).to receive_message_chain(:new, :weather_type).and_return("calm")
				expect(subject.unsafe_to_fly?).to eq(false)
			end
		end
	end
end
