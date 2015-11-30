require 'airport'

describe Airport do 

	subject(:airport) { described_class.new(20) }
	let(:plane) { double :plane }
	let(:plane1) { double :plane }

	it "should respond to land plane method call" do 
		expect(airport).to respond_to :land
	end

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:planes) }

	it "returns landed planes" do 
		allow(plane).to receive(:landed).and_return(true)
		airport.land(plane)
		expect(airport.planes).to eq [plane]
	end

	it "returns an array of landed planes" do 
		allow(plane).to receive(:landed).and_return(true)
		allow(plane1).to receive(:landed).and_return(true)

		airport.land(plane)
		airport.land(plane1)
		expect(airport.planes).to eq [plane, plane1]
	end

	it { is_expected.to respond_to(:takeoff).with(1).argument }

	it "makes a plane takeoff" do 
		allow(plane).to receive(:landed).and_return(true)
		allow(plane).to receive(:flying).and_return(false)
		airport.land(plane)
		airport.takeoff(plane)
		expect(airport.planes).to_not include plane
	end

	it "should raise an error if a landed plane is told to land" do
		allow(plane).to receive(:landed).and_return(true)
		airport.land(plane)
		expect { airport.land(plane) }.to raise_error "Plane has already landed!"
	end

	it "should raise an error if a non existing plane is told to takeoff" do
		allow(plane).to receive(:landed).and_return(true)
		allow(plane).to receive(:flying).and_return(false)
		airport.land(plane)
		airport.takeoff(plane)
		expect { airport.takeoff(plane) }.to raise_error "Plane not in airport"
	end


	it  "does not allow landing when at capacity" do
		allow(plane).to receive(:landed).and_return(true)
		20.times do 
			airport.land(plane)
		end
		expect { aiport.land(plane) }.to raise_error "Cannot land plane: airport is full!"
	end

	



		

	



end 
