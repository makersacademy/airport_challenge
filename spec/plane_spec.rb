require 'plane'

describe Plane do
	let(:airport){ spy(:airport) }
	let(:weather){ double(:weather) }

	context 'when trying to land' do
		it 'should tell the airport we want it to receive the plane if plane is not already landed' do
			subject.try_to_land(airport)
			expect(airport).to have_received(:receive).with(subject,weather)
		end
		it 'should not tell the airport we want it to receive the plane if plan is already landed' do
			subject.land(airport)
			subject.try_to_land(airport)
			expect(airport).not_to have_received(:receive).with(subject,weather)
		end
		it '#land should set a landed attribute to true' do
			subject.land(airport)
			expect(subject.landed?).to eq true
		end
		it '#land should store the plan\'s location' do
			subject.land(airport)
			expect(subject.location).to eq airport
		end
		it '#land should return a status update explaining that the plan landed successfully' do
			expect(subject.land(airport)).to eq "Plane landed successfully..."
		end
	end

end