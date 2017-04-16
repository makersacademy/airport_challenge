require 'Airport'

describe Airport do

	describe :new do 
		subject(:airport) {Airport}
		it 'Should return instance of Airport when initialized' do
			expect(airport).to respond_to(:new)
		end
	end

	describe  '#land' do
		subject(:airport) {Airport.new}
		before(:each) do 
			@plane = Plane.new
		end

		it "Should accept one plane as a parameter" do
		    expect { airport.land(@plane) }.to_not raise_error
		end

		it "Should not accept more than one plane as parameters" do
		    expect { airport.land(@plane, @plane) }.to raise_error(ArgumentError)
		end

		it "Should return error when passing something other than a plane object" do
		    expect { airport.land(airport) }.to raise_error(ArgumentError, 'Not a valid plane object')
		end

		it "Should confirm that a plane has landed" do
			airport.land(@plane)
		    expect(airport.at_airport?(@plane)).to be_truthy
		end
	end

	describe  '#takeoff' do
		before(:each) do 
			@airport =  Airport.new 
			@plane = Plane.new
			@airport.land(@plane) 
		end

		it "Should expect a parameter" do
		    expect { @airport.takeoff }.to raise_error(ArgumentError)
		end

		it "Should raise error if plane told to takeoff is not at airport" do
			plane2 = Plane.new
		    expect { @airport.takeoff(plane2) }.to raise_error(ArgumentError, "Plane not at this airport")
		end

		it "Should raise error if not passed a valid plane object" do
			plane_dummy = "Not a plane"
		    expect { @airport.takeoff(plane_dummy) }.to raise_error(ArgumentError, "Not a valid plane object")
		end

		it "Should allow plane that has landed to takeoff" do
		    expect { @airport.takeoff(@plane) }.to_not raise_error
		end

		it "Should confirm that a plane has taken off" do
			@airport.takeoff(@plane)
		    expect(@airport.at_airport?(@plane)).to be_falsey
		end
	end


end
