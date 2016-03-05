require './docs/plane'

describe Plane do

let(:airport) {Airport.new}

	it 'can take off from an airport' do 
		expect { is_expected.to respond_to take_off(airport) }
	end	

	it 'will take off and confirm that it is no longer in the airport' do 
		expect(subject.take_off(airport)).to eq 'This plane has taken off and is no longer in the airport'
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

	it 'will land at an airport and confirm that it has landed' do
		expect(subject.land(airport)).to eq 'This plane has now landed'
	end

	it 'will land at an airport and will then be in that airport' do 
		subject.land(airport)
		expect(airport.storage.length).to eq 1
	end
end