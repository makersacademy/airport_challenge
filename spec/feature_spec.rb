describe 'Feature tests' do
	describe 'Airport-Plane communication' do
	 	let(:plane1)        { Plane.new }
	 	let(:plane2)		{ Plane.new }
	 	let(:airport)       { Airport.new }
	 	let(:small_airport) { Airport.new(1) }
	 	let(:storm)         { airport.instance_variable_set(:@stormy, true) }
	 	let(:sunny)         { airport.instance_variable_set(:@stormy, false) }
	 	let(:confirmlanded) { "Confirming that plane has landed." }
	 	let(:noplane_error) { "No such plane is presently at the airport." } 
	 	let(:stormytakeoff) { "The weather is too harsh for a safe take-off!" }
	 	let(:stormylanding) { "The weather is too harsh for a safe landing, please circle back. Over." }
	 	let(:full)          { "The airport is full! Circle until a plane has taken off. Over." }
	 	let(:takeoff2)		{ "We've already taken off, Sir! Are you feeling alright?" }
	 	let(:landing2)		{ "This plane is already on the ground, Captain!" }

	 	describe 'Landing and landing confirmation' do
	 		# As an air traffic controller 
			# So I can get passengers to a destination 
			# I want to instruct a plane to land at an airport and confirm that it has landed
	 		it 'should change the state of the plane to not flying' do
	 			plane1.land(airport)
	 			expect(plane1.landed?).to eq true
	 		end

	 		it 'should make the plane appear in the airport' do
	 			plane1.land(airport)
	 			expect(airport.plane_status(plane1)).to eq confirmlanded
	 		end
	 	end

	 	describe 'Takeoff and takeoff confirmation' do
			it 'should change the state of the plane to flying' do
				# As an air traffic controller 
				# So I can get passengers on the way to their destination 
				# I want to instruct a plane to take off from an airport and 
				# confirm that it is no longer in the airport
				plane1.land(airport)
				sunny
				plane1.takeoff(airport)
				expect(plane1.landed?).to eq false
			end

			it 'should make the plane leave the airport' do
				plane1.land(airport)
				sunny
				plane1.takeoff(airport)
				expect(airport.plane_status(plane1)).to eq noplane_error
			end
	 	end

	 	describe 'Takeoff exceptions' do
	 		it 'prevents takeoff when weather is stormy' do
	 			# As an air traffic controller 
				# To ensure safety 
				# I want to prevent takeoff when weather is stormy 
				plane1.land(airport)
				storm
				expect{plane1.takeoff(airport)}.to raise_error stormytakeoff
	 		end
	 	end

	 	describe 'Landing exceptions' do
	 		it 'prevents landing when weather is stormy' do
	 			# As an air traffic controller 
				# To ensure safety 
				# I want to prevent landing when weather is stormy 
				storm
				expect{plane1.land(airport)}.to raise_error stormylanding
	 		end

	 		it 'prevents landing when the airport is full' do
	 			# As an air traffic controller 
				# To ensure safety 
				# I want to prevent landing when the airport is full
				sunny
				plane1.land(small_airport)
				sunny
				expect{plane2.land(small_airport)}.to raise_error full
	 		end

	 		it 'allows capacity to be changed' do
	 			# As the system designer
				# So that the software can be used for many different airports
				# I would like a default airport capacity that can be 
				# overridden as appropriate
				plane1.land(small_airport)
				sunny
				expect{plane2.land(small_airport)}.to raise_error full
	 		end
	 	end

	 	describe 'edge cases' do
	 		it 'prevents planes taking off from airports that they arent at' do
	 			expect{airport.confirm_takeoff(plane1)}.to raise_error noplane_error
	 		end

	 		it 'prevents planes from taking off if they are flying' do
	 			expect{plane1.takeoff(airport)}.to raise_error takeoff2
	 		end

	 		it 'prevents landed planes from landing again' do
	 			plane1.land(airport)
	 			expect{plane1.land(airport)}.to raise_error landing2
	 		end
	 	end

	end
end
 


