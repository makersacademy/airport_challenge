describe "creating and using an airport", :type => :feature do

	it 'lands planes on average 80% of the time' do

		airport = Airport.new(1001)

		land_success_rate = 0

		1000.times do 
			begin
				airport.land(Plane.new)
				land_success_rate += 1
			rescue
				next
			end
		end

		expect(land_success_rate).to be_within(50).of(800)

	end

	it 'takes off planes on average 80% of the time' do

		airport = Airport.new(10000)

		taken_off_success_rate = 0
		landed_planes = []

		until landed_planes.length == 1000 do 
			begin
				plane = Plane.new
				airport.land(plane)
				landed_planes << plane
			rescue
				next
			end
		end

		landed_planes.each do |plane|
			begin
				airport.take_off(plane)
				taken_off_success_rate += 1
			rescue
				next
			end
		end

		expect(taken_off_success_rate).to be_within(50).of(800)

	end

end