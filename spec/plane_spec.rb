require 'plane'

describe Plane do
	let(:airport){ spy(:airport) }

	context 'when trying to land' do
		it 'should tell the airport we want it to receive the plane' do
			subject.try_to_land(airport)
			expect(airport).to have_received(:receive).with(subject)
		end
	end

end