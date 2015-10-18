require "./lib/Airport.rb"


describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:take_off) }

	it "return can not land, airport is full!" do
		allow(subject.weather).to receive(:stormy?).and_return false
		plane = Plane.new
		subject.capacity.times { subject.land(plane) }
		expect { subject.land(plane) }.to raise_error "Can not land, airport is full!"
	end

	it "return Can not take off, weather is too bad" do
		allow(subject.weather).to receive(:stormy?).and_return true
		plane = Plane.new
		expect { subject.take_off }.to raise_error "Can not take off, weather is too bad."
	end

	it "return Can not land, weather is too bad" do
		allow(subject.weather).to receive(:stormy?).and_return true
		plane = Plane.new
		expect { subject.land(plane) }.to raise_error "Can not land, weather is too bad."
	end
end
