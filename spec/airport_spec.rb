require 'airport'


describe Airport do 
	subject(:airport) {described_class.new}

	describe '#returns new instance of airport' do
		it 'returns an instance of airport' do	
		expect(airport).to be_a(Airport)
		end
	end


	describe '#land' do
		let(:plane) {double(:plane)}

		it {is_expected.to respond_to(:land).with(1).argument}

		it 'lands plane' do
			expect(airport.land(plane)).to include plane
		end
	end


	# describe '#takeoff' do
	# 	let(:plane) {double(:plane)}

	# 	it {is_expected.to respond_to(:takeoff).with(1).argument}

		# it 'removes plane from airport' do
		# 	airport.land(plane)
		# 	airport.takeoff(plane)
		# 	expect(airport.planes).not_to include(plane)
		# end
	# end

end

