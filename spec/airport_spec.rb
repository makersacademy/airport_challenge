require 'Airport'

describe Airport do

	describe :new do 
		subject(:airport) {Airport}
		it 'Should return instance of Airport when initialized' do
			expect(airport).to respond_to(:new)
		end
		it "Should accept integer as a parameter" do
			 expect { airport.new(2) }.to_not raise_error
		end
		it "Should only accept integer as a parameter" do
			 expect { airport.new("two") }.to raise_error
		end
		it "Should default capacity to DEFAULT_CAPACITY when no argument passed" do
			airport = subject.new
			expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
		end
	end

	describe  '#land' do
		context "Argument validation" do
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
		end
		context "Core functionality" do
			subject(:airport) {Airport.new}
			before(:each) do 
				@plane = Plane.new
			end
			it "Should not land and raise error if airport is full" do
				airport_full = Airport.new(0)
			    expect { airport_full.land(@plane) }.to raise_error 'Airport full'
			    expect(airport_full.at_airport?(@plane)).to be false
			end
			it "Should confirm that a plane has landed" do
				airport.land(@plane)
			    expect(airport.at_airport?(@plane)).to be_truthy
			end
			it "Should not land a plane if weather is stormy" do
				airport.weather_update(:storm, true)
				expect {airport.land(@plane)}.to raise_error 'Weather not safe enough'
			    expect(airport.at_airport?(@plane)).to be false
			end
		end
	end

	describe  '#takeoff' do
		context "Argument validation" do
			subject(:airport) {Airport.new}
			before(:each) do 
				@plane = Plane.new
				airport.land(@plane) 
			end
			it "Should expect a parameter" do
			    expect { airport.takeoff }.to raise_error(ArgumentError)
			end

			it "Should raise error if plane told to takeoff is not at airport" do
				plane2 = Plane.new
			    expect { airport.takeoff(plane2) }.to raise_error(ArgumentError, "Plane not at this airport")
			end

			it "Should raise error if not passed a valid plane object" do
				plane_dummy = "Not a plane"
			    expect { airport.takeoff(plane_dummy) }.to raise_error(ArgumentError, "Not a valid plane object")
			end
		end
		context "Core functionality" do
			subject(:airport) {Airport.new}
			before(:each) do 
				@plane = Plane.new
				airport.land(@plane) 
			end
			it "Should not takeoff if weather is stormy" do
				airport.weather_update(:storm, true)
				expect { airport.takeoff(@plane) }.to raise_error 'Weather not safe enough'
			    expect(airport.at_airport?(@plane)).to be true
			end

			it "Should allow plane that has landed to takeoff" do
			    expect { airport.takeoff(@plane) }.to_not raise_error
			end

			it "Should confirm that a plane has taken off" do
				airport.takeoff(@plane)
			    expect(airport.at_airport?(@plane)).to be_falsey
			end
		end
	end


	describe '#weather_update' do
		context "Argument validation" do
			subject(:airport) {Airport.new}
			it "Should raise error if wrong number of arguments passed" do
				expect { airport.weather_update(:storm) }.to raise_error(ArgumentError)
			end
			it "Should raise error if weather key is wrong" do
				expect { airport.weather_update("foo", 2) }.to raise_error(RuntimeError, 'Invalid weather type key')
			end
			it "Should raise error if wind value is wrong" do
				expect { airport.weather_update(:wind, 6) }.to raise_error(ArgumentError, 'Invalid wind value')
			end
			it "Should raise error if weather value is wrong" do
				expect { airport.weather_update(:storm, 1) }.to raise_error(RuntimeError, 'Expecting boolean')
			end
		end
		context "Core functionality" do
			subject(:airport) {Airport.new}
			it "Should update @weather with new value" do
				airport.weather_update(:storm, true)
				expect(airport.weather[:storm]).to be true
			end
		end
	end

end
