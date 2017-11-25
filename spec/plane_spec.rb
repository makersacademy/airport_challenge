require "plane"
describe Plane do 
	let :airport {double(:airport, expecting?: true)}
	describe "#location" do
		it "should be flying if not in an airport" do
			expect(subject.location).to eq "Flying"
		end

		it "should return an airport if in one" do
			subject.land airport
			expect(subject.location).to eq airport
		end
	end

	describe "#land" do
		it "shouldn't be able to land if not flying" do
			subject.land airport
			expect {subject.land airport}.to raise_error "Already Landed"
		end
		it "should check that the plane is expected before trying to land" do
			expect(airport).to receive(:expecting?).with(subject)
			subject.land(airport)  
		end
	end

	describe "#take_off" do
		it "shouldn't be able to take off if already flying" do
			expect {subject.take_off}.to raise_error "Already In Flight"
		end
		it "should be flying after take_off" do
			subject.land(airport)
			subject.take_off
			expect(subject.location).to eq "Flying"
		end
	end
	


end
