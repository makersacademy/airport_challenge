require 'airport'

RSpec.describe Airport do
	describe 'Airport initialize' do
		it 'allows user to set airport capacity and be overridden' do
			port = Airport.new(200)
			expect(port.capacity).to eq 200
		end
	end

		it 'traffic controller tells plane to land at airport' do
			port = Airport.new
			plane = Plane.new
			port.land_plane(port)
			expect(port.planes_at_airport).to contain_exactly(port)
		end


		it 'tells plane to takeoff and confirms it isnt in airport anymore' do
			plane = Plane.new
			expect(subject.plane_takeoff_confirmation).to eq "WE OUTTA HERE!!"
		end

		it 'prevents landing when airport is full' do
			plane = Plane.new
			airport = Airport.new(1)
			airport.land_plane(plane)
			expect(airport.full?). to eq true
		end

		it 'rasies an error when plane tries landing in a full airport' do
			plane = Plane.new
			subject.capacity.times { subject.land_plane Plane.new }
			expect { subject.land_plane(plane) }.to raise_error 'airport is full'
		end
end
