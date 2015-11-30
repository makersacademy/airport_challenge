require 'airport'
describe Airport do 
	it "instructs a plan to land" do
		airport = Airport.new(20)
		plane = Plane.new
		airport.land(plane)
		expect(airport).to respond_to(:land).with(1).argument
	end

	it "instucts planes to take off" do
		airport = Airport.new(20)
		plane = Plane.new
		expect(airport).to respond_to(:takeoff).with(1).argument
	end

	it "does not allow planes to land when airport is full" do 
		airport = Airport.new(20)
		plane = Plane.new
		20.times do 
			airport.land(plane)
		end
		expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full!"
	end

end
