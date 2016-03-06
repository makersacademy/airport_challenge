require './docs/plane'

describe Plane do

	it { is_expected.to respond_to :plane_status}

	describe 'sunny weather' do 

		let(:airport) {double :airport, :storage => [subject], :airport_open? => true, :in_airport? => true}
		let(:airport1) {double :airport, :storage => [], :airport_open? => true, :in_airport? => true}

		describe 'takeoff' do 

			xit 'can take off from an airport' do 
				expect { is_expected.to respond_to take_off(airport) }
			end	

			it 'will take off and confirm that it is no longer in the airport' do 		

				expect(subject.take_off(airport)).to eq 'This plane has taken off and is now in the air.'
			end	

			it 'will after takeoff, no longer be in the airport' do
				subject.take_off(airport)
				expect(airport.storage).to eq []
			end

			it 'will after takeoff, no longer be in the aiport, whilst other planes are' do
				3.times {airport1.storage << Plane.new }
				plane1 = airport1.storage[1]
				plane1.take_off(airport1)
				expect(airport1.storage).not_to include(plane1)
			end

			it 'cannot takeoff from an airport if it is not already in that airport' do 
				allow(airport).to receive(:in_airport?).and_return(false)
				expect {subject.take_off(airport)}.to raise_error 'This plane is not at this airport, so it cannot take off from here.'
			end
		end

		describe 'landing' do

			it 'will land at an airport and confirm that it has landed' do
				allow(airport).to receive(:full?).and_return(false)
				subject.take_off(airport)
				expect(subject.land(airport)).to eq 'This plane has now landed.'
			end

			it 'will land at an airport and will then be in that airport' do 
				expect(airport.storage.length).to eq 1
			end

			it 'will not land if airport is full' do 
				50.times {airport.storage << Plane.new }
				allow(airport1).to receive(:full?).and_return(true)
				expect {subject.land(airport1)}.to raise_error 'This airport is full. Do not land.'
			end

			it 'cannot land if the plane is already at the airport' do 
				allow(airport).to receive(:full?).and_return(false)
				expect {subject.land(airport)}.to raise_error 'This plane is already at an airport.'
			end
		end
	end

	describe 'Stormy weather' do 

		let(:airport) {double :airport,  :airport_open? => false}


			it 'announces that the airport is closed when a plan tries to takeoff or land during stormy weather' do
				expect(subject.land(airport)).to eq "Due to stormy weather, this airport is closed" 
				expect(subject.take_off(airport)).to eq "Due to stormy weather, this airport is closed" 
			end
	end
end