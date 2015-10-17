require "./lib/Airport.rb"


describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:take_off) }

	it "return can not land, airport is full!" do
		plane = Plane.new
		subject.capacity.times { subject.land(plane) }
		expect { subject.land(plane) }.to raise_error "Can not land, airport is full!"
	end

end
