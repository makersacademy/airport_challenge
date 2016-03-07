require 'plane'

describe Plane do

	it 'gives the status of a plane' do
		expect(subject.status).to eq("Airborne" || "Landed")
	end

end
