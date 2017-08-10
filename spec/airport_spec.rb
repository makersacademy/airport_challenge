#Airport Spec

require 'airport'

describe Airport do 

	let(:plane) { double :plane }

	it "Lands planes" do 
		expect(subject).to respond_to :land
	end

	it "Confirms plane has landed" do
		allow(subject).to receive(:bad_weather?).and_return(false)
		subject.land(plane)
		expect(subject.landed?(plane)).to eq true 
	end

	it "Allows planes to take off" do 
		expect(subject).to respond_to :take_off
	end

	it "Confirms a plane has taken off" do 
		allow(subject).to receive(:bad_weather?).and_return(false)
		subject.take_off(plane)
		expect(subject.taken_off?(plane)).to eq true
	end

	it "Prevents landing if airport is full" do 
		allow(subject).to receive(:full?).and_return(true)
		allow(subject).to receive(:bad_weather?).and_return(false)
		expect {subject.land (plane)}.to raise_error "ERROR: Airport is full"
	end

	it "Will not land planes in bad weather" do
		allow(subject).to receive(:full?).and_return(false)
		allow(subject).to receive(:bad_weather?).and_return(true)
		expect {subject.land (plane)}.to raise_error "ERROR: Weather Is Not Good Enough To Land"
	end

	it "Won't allow planes to take off in bad weather" do
		allow(subject).to receive(:bad_weather?).and_return(false)
		subject.land(plane)
		allow(subject).to receive(:bad_weather?).and_return(true)
		expect {subject.take_off (plane)}.to raise_error "ERROR: Weather Is Not Good Enough To Take Off"
	end

	it 'Gives a DEFAULT_CAPACITY of 50' do
		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
		expect(Airport.new(20).capacity).to eq 20
		expect(Airport.new(190).capacity).to eq 190
	end
end








