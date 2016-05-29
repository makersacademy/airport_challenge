#Airport Spec

require 'airport'

describe Airport do 

	let(:plane) { double :plane }

	it "lands planes" do 
		expect(subject).to respond_to :land
		#it { is_expected.to respond_to (:land).with(1).argument }
	end

	it "confirms plane has landed" do
		#plane = Plane.new
		allow(subject).to receive(:weather?).and_return("Good Weather")
		subject.land(plane)
		expect(subject.landed?(plane)).to eq true 
	end

	it "allows planes to take off" do 
		expect(subject).to respond_to :take_off
	end

	it "confirms a plane has taken off" do 
		#plane = Plane.new
		subject.take_off(plane)
		expect(subject.taken_off?(plane)).to eq true
	end

	it "Prevents landing if airport is full" do 
		Airport::DEFAULT_CAPACITY.times {subject.land double(:plane)}
		expect {subject.land double(:plane)}.to raise_error "ERROR: Airport is full"
	end

	it "Will not land planes in bad weather" do
		allow(subject).to receive(:weather?).and_return("Bad Weather")
		expect(subject.land(plane)).to raise_error "ERROR: Weather Is Not Good Enough To Land"


end
end
