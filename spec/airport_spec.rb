require 'airport'
# require 'plane'

describe Airport do 

airport = Airport.new

	it 'returns an instance of airport' do	
		expect(airport).to be_a(Airport)
	end

	describe '#landing' do

		it {is_expected.to respond_to(:land).with(1).argument}

		it 'lands a plane at the airport' do
			plane = double(:plane)
			expect(subject.land(plane)).to eq [plane] #and to eq ('the plane has landed'), but can't make this work (spent hours trying to!!)
		end
	end

	describe '#takeoff' do

		it {is_expected.to respond_to(:takeoff)}

		it 'expects plane to takeoff' do
			plane = double(:plane)
			expect(subject.takeoff).to eq [plane] #and to eq ('the plane has taken off'), but can't make this work!
		end
	end

end