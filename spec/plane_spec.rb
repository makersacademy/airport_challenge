require 'plane'

describe Plane do
	let(:airport){ spy(:airport) }
	let(:weather){ double(:weather) }
	let(:plane){ Plane.new(weather) }

	context 'when trying to land' do
		it 'should tell the airport we want it to receive the plane if plane is not already landed' do
			plane.try_to_land(airport)
			expect(airport).to have_received(:receive).with(plane,weather)
		end
		it 'should not tell the airport we want it to receive the plane if plan is already landed' do
			plane.land(airport)
			plane.try_to_land(airport)
			expect(airport).not_to have_received(:receive).with(plane,weather)
		end
		it '#land should set a landed attribute to true' do
			plane.land(airport)
			expect(plane.landed?).to eq true
		end
		it '#land should store the plan\'s location' do
			plane.land(airport)
			expect(plane.location).to eq airport
		end
		it '#land should return a status update explaining that the plan landed successfully' do
			expect(plane.land(airport)).to eq "Plane landed successfully..."
		end
	end

end