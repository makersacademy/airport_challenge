require 'airport'

describe Airport do

	airport = Airport.new

	describe '#basic tests' do

		it 'returns an instance of airport' do
		expect(airport).to be_a(Airport)
		end

		it {is_expected.to respond_to(:land).with(1).argument}   #land method in class Airport

		it {is_expected.to respond_to(:planes_landed)}  #planes_landed method in class Airport

	end

	describe '#landing' do

		it 'lands a plane' do
		plane = double(:plane)
		expect(subject.land(plane)).to eq [plane]  #land method in class Airport
		end

		it 'confirms plane has landed' do
		plane = double(:plane)
		subject.land(plane)
		expect(subject.planes_landed).to eq [plane]  #planes_landed method in class Airport	
		end
	end

	describe '#taking off' do

		it 'confirms plane has taken off' do
		plane = double(:plane)
		subject.land(plane)
		expect(subject.planes_takenoff).to eq (plane)  #planes_takenoff method in class Airport	
		end
	end
end

#why needed () around plane in 'confirms plane has taken off' test?


