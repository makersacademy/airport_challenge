require 'Airport'


describe 'Features' do
	
	context 'User story tests' do
		subject(:airport) {Airport.new}
		before(:each) do
			@plane = Plane.new
		end

		it "A controller can instruct plane to land and confirm landing" do
			airport.land(@plane)
			expect(airport.at_airport?(@plane)).to be true
		end

		it "A controller can instruct plane to takeoff and confirm it is no longer there" do
			airport.land(@plane)
			airport.takeoff(@plane)
			expect(airport.at_airport?(@plane)).to be false
		end

		it "A plane cannot takeoff when it is stormy" do
			airport.land(@plane)
			airport.weather_update(:storm, true)
			expect {airport.takeoff(@plane)}.to raise_error 'Weather not safe enough'
			expect(airport.at_airport?(@plane)).to be true
		end

		it "A plane cannot land when it is stormy" do
			airport.weather_update(:storm, true)
			expect {airport.land(@plane)}.to raise_error 'Weather not safe enough'
			expect(airport.at_airport?(@plane)).to be false
		end

		it "A plane cannot land and raise error if airport is full" do
			airport_full = Airport.new(0)
		    expect { airport_full.land(@plane) }.to raise_error 'Airport full'
		    expect(airport_full.at_airport?(@plane)).to be false
		end

		it "The airport capacity can be overidden" do
			airport_small = Airport.new(5)
		    expect(airport_small.capacity).to eq 5
		end
	end

	context 'Simulation test' do
		it "Lands and takes off lots of planes" do
			airport = Airport.new
			plane_1 = Plane.new
			airport.land(plane_1)
			9.times {
				plane = Plane.new
				airport.land(plane)}
			9.times {
				airport.takeoff(airport.landed.last[:plane])
			}
			expect(airport.at_airport?(plane_1)).to be true
		end
	end
end