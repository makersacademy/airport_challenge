require './docs/plane'

describe Plane do

let(:airport) {Airport.new}

	it { is_expected.to respond_to :plane_status}

	describe 'takeoff' do 

		it 'can take off from an airport' do 
			expect { is_expected.to respond_to take_off(airport) }
		end	

		it 'will take off and confirm that it is no longer in the airport' do 
			london = Airport.new 
			london.storage << subject
			expect(subject.take_off(london)).to eq 'This plane has taken off and is now in the air.'
		end	

		it 'will after takeoff, no longer be in the airport' do
			airport.storage << subject
			subject.take_off(airport)
			expect(airport.storage).to eq []
		end

		it 'will after takeoff, no longer be in the aiport, whilst other planes are' do
			3.times {airport.storage << Plane.new }
			plane1 = airport.storage[1]
			plane1.take_off(airport)
			expect(airport.storage).not_to include(plane1)
		end

		it 'cannot takeoff from an airport if it is not already in that airport' do 
			expect {subject.take_off(airport)}.to raise_error 'This plane is not at this airport, so it cannot take off from here.'
		end
	end

	describe 'landing' do

		it 'will land at an airport and confirm that it has landed' do
			airport.storage << subject
			subject.take_off(airport)
			expect(subject.land(airport)).to eq 'This plane has now landed.'
		end

		it 'will land at an airport and will then be in that airport' do 
			airport.storage << subject
			subject.take_off(airport)
			subject.land(airport)
			expect(airport.storage.length).to eq 1
		end

		it 'will not land if airport full' do 
			50.times {airport.storage << Plane.new }
			expect {subject.land(airport)}.to raise_error 'This airport is full. Do not land.'
		end

		it 'cannot land if the plane is already at the airport' do 
			airport.storage << subject
			expect {subject.land(airport)}.to raise_error 'This plane is already at an airport.'
		end
	end
end