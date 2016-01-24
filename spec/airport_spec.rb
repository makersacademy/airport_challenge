require 'airport'
# require 'plane'

describe Airport do 

airport = Airport.new

	it 'returns an instance of airport' do	
		expect(airport).to be_a(Airport)
	end

	it {is_expected.to respond_to(:land).with(1).argument}

	it 'lands a plane at the airport' do
		plane = double(:plane)
		expect(subject.land(plane)).to eq [plane] #and to eq ('the plane has landed')
	end

end