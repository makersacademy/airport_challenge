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





