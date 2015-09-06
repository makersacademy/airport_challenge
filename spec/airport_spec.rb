require 'airport'

describe Airport do

	let(:airport) { Airport.new }
  	let(:plane) { Plane.new }

	describe "landing" do 

		it { is_expected.to respond_to(:instruct_to_land).with(1).argument}
		it { is_expected.to respond_to(:stormy?)}

		it "planes array increase by 1 for each landing" do 
			airport.instruct_to_land(plane)
			expect {subject.instruct_to_land(plane)}.to change{subject.plane_count.length}.by(1)
		end 

		it "Raise error when airport is full" do
			subject.capacity.times{subject.instruct_to_land Plane.new}
			expect {subject.instruct_to_land Plane.new}.to raise_error "Plane cannot land. Circle until capacity is released"
		end 

		it "Raise error when trying to land same plane twice" do	
			subject.instruct_to_land(plane)
			expect {subject.instruct_to_land(plane)}.to raise_error "Plane has already landed"
		end 

		it "Raise error when trying to land plane in stormy weather" do	
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.instruct_to_land(plane)}.to raise_error "Plane cannot land. Wait until wind slows down"
		end 

 	end 

	describe 'take off' do

		it { is_expected.to respond_to(:instruct_to_take_off).with(1).argument}
	 
	 	it "planes array decrease by 1 for each take-off" do 
			airport.instruct_to_take_off(plane)
		end 

	end 
	
end