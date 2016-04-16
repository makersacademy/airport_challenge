require 'plane'

describe Plane do
	let(:airport){ spy(:airport) }

	context 'when trying to land' do
		it 'should tell the airport we want it to receive the plane if plane is not already landed' do
			subject.try_to_land(airport)
			expect(airport).to have_received(:receive).with(subject)
		end
		it 'should not tell the airport we want it to receive the plane if plan is already landed' do
			subject.land(airport)
			subject.try_to_land(airport)
			expect(airport).not_to have_received(:receive).with(subject)
		end
		it '#land should set a landed attribute to true' do
			subject.land(airport)
			expect(subject.landed?).to eq true
		end
		it '#land should store the plane\'s location' do
			subject.land(airport)
			expect(subject.location).to eq airport
		end
		it '#land should return a status update explaining that the plane landed successfully' do
			expect(subject.land(airport)).to eq "Plane landed successfully..."
		end
		it '#land_fails should return a status update explaining why the plane didn\'t land' do
			expect(subject.land_fails("full")).to eq "Plane failed to land because airport is already full"
			expect(subject.land_fails("weather")).to eq "Plane failed to land because of bad weather"
		end
	end

	it '#landed? should tell you whether it is landed or not' do
		expect(subject.landed?).to eq false
		subject.land(airport)
		expect(subject.landed?).to eq true
	end

	context 'when trying to take off' do
		it 'should tell the airport we want it to dispatch the plane if the plane is in an airport' do
			subject.land(airport)
			subject.try_to_takeoff
			expect(airport).to have_received(:dispatch).with(subject)
		end
		it 'should not tell the airport we want it to dispatch the plane if the plane is not in an airport' do
			subject.try_to_takeoff
			expect(airport).not_to have_received(:dispatch).with(subject)
		end
		it '#take_off should set the landed attribute to false' do
			subject.land(airport)
			subject.take_off
			expect(subject.landed?).to eq false
		end
		it '#take_off should set the plane\'s location to "sky"' do
			subject.land(airport)
			subject.take_off
			expect(subject.location).to eq "sky"
		end
	end

end