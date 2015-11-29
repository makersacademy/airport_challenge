require 'airport'

describe Airport do 
	it "should respond to land plane method call" do 
		expect(subject).to respond_to :land
	end

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:planes) }

	it "returns landed planes" do 
		plane = Plane.new
		subject.land(plane)
		expect(subject.planes).to eq [plane]
	end

	it "returns an array of landed planes" do 
		plane = Plane.new
		plane1 = Plane.new
		subject.land(plane)
		subject.land(plane1)
		expect(subject.planes).to eq [plane, plane1]
	end

	it { is_expected.to respond_to(:takeoff).with(1).argument}

	it "makes a plane takeoff" do 
		plane = Plane.new
		subject.land(plane)
		subject.takeoff(plane)
		expect(subject.planes).to_not eq [plane]
	end

	it "should raise an error if a landed plane is told to land" do
		plane = Plane.new
		subject.land(plane)
		expect { subject.land(plane) }.to raise_error "Plane has already landed!"
	end

	it "should raise an error if a non existing plane is told to takeoff" do
		plane = Plane.new
		subject.land(plane)
		subject.takeoff(plane)
		expect { subject.takeoff(plane) }.to raise_error "Plane not in airport"
	end





		

	



end 
