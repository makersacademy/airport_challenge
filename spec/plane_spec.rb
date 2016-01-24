require 'plane'

describe Plane do
	subject (:plane) {described_class.new}

	describe '#land' do
		let(:airport) {double :airport}

		it {is_expected.to respond_to(:land).with(1).argument}

		it 'expects plane to land' do
			plane.land(airport)
			expect(plane).to be_landed
		end


		it 'lands at an airport' do
			plane.land(airport)
			expect(plane.airport?).to eq airport
		end
	end

	# describe '#takeoff' do
	# 	let(:airport) {double :airport}

	# 	it {is_expected.to respond_to(:takeoff).with(1).argument}

	# 	it 'is will be deleted from airport' do
	# 		plane.land(airport)
	# 		plane.takeoff(airport)
	# 		expect(plane.new_airport).to eq false
	# 	end
	end





# describe Plane do 

# plane = Plane.new
# airport = Airport.new

# 	describe '#instantiating a new plane' do

# 		it 'returns an instance of plane' do
# 		expect(plane).to be_a(Plane) #IRB returns new object_id, so creates a new instance
# 		end
# 	end


# 	describe '#land' do

# 		it {is_expected.to respond_to(:land).with(1).argument}

# 		it 'returns a new instance of airport when landed' do
# 			expect(subject.land(airport)).to eq airport 
# 		end

# 		it 'lands a plane' do
# 			plane = double(:landed_plane)
# 			expect(subject.land(plane)).to eq [plane] 
# 		end

# 		# it 'raises an error if already landed' do
# 		# 	subject.land(airport)
# 		# 	expect{subject.land(airport)}.to raise_error('ERROR: plane already landed')
# 		# end

# 			describe '#landed?' do

# 			it 'returns true when landed?' do
# 				expect(subject.landed?).to eq true
# 			end
# 		end
# 	end


# 	describe '#takeoff' do

# 		it {is_expected.to respond_to(:takeoff)}

# 		it 'expects plane to takeoff' do
# 			plane = double(:landed_plane)
# 			expect(subject.takeoff).to eq [plane] #and to eq ('the plane has taken off'), but can't make this work!
# 		end

# 		# it 'raises an error if already takenoff' do
# 		# 	subject.land(airport)
# 		# 	subjet.takeoff(airport)
# 		# 	expect {subject.takeoff(airport)}.to raise_error('ERROR: plane already takenoff')
# 		# end
# 	end
# end