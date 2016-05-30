#Airport Spec

require 'airport'

describe Airport do 

	let(:plane) { double :plane }

	it "Lands planes" do 
		expect(subject).to respond_to :land
		#it { is_expected.to respond_to (:land).with(1).argument }
	end

	it "Confirms plane has landed" do
		#plane = Plane.new
		allow(subject).to receive(:bad_weather?).and_return(false)
		plane = double(:plane)
		subject.land(plane)
		expect(subject.landed?(plane)).to eq true 
	end

	it "Allows planes to take off" do 
		expect(subject).to respond_to :take_off
	end

	it "Confirms a plane has taken off" do 
		#plane = Plane.new
		allow(subject).to receive(:forecast?).and_return(false)
		subject.take_off(plane)
		expect(subject.taken_off?(plane)).to eq true
	end

	it "Prevents landing if airport is full" do 
		## NOT SURE ABOUT FIRST LINE OF CODE 
		allow(subject).to receive(:full?).and_return(true)
		allow(subject).to receive(:bad_weather?).and_return(false)
		#Airport::DEFAULT_CAPACITY.times {subject.land double(:plane)}
		expect {subject.land (double(:plane))}.to raise_error "ERROR: Airport is full"
	end

	it "Will not land planes in bad weather" do
		#weather = Weather.new
		allow(subject).to receive(:full?).and_return(false)
		allow(subject).to receive(:bad_weather?).and_return(true)
		#expect(subject.land(plane)).to raise_error("ERROR: Weather Is Not Good Enough To Land")
		expect {subject.land (double(:plane))}.to raise_error "ERROR: Weather Is Not Good Enough To Land"
	end

	it 'Gives a DEFAULT_CAPACITY of 50' do
		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	end
end








