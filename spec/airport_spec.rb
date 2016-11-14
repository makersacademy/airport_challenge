require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
	let(:grounded_plane) {double(:plane, :flying => false)}
	let(:flying_plane) {double(:plane, :flying => true)}
	let(:plane) {double(:plane)}

	it 'expects airports to be full when capacity is reached' do
		airport = Airport.new(0)
		message = "Airport is full."
		expect{airport.land(flying_plane)}.to raise_error message
	end

	describe '#land' do

		it 'expects landing to raise error if weather is stormy' do
			allow(airport).to receive(:stormy?) { true }
			message = "#{flying_plane} cannot land due to stormy weather."
			expect{airport.land(flying_plane)}.to raise_error message
		end

		context '#land tests that require non-stormy weather' do

			before do
				allow(airport).to receive(:stormy?) { false }
			end

			it 'expects a landing to be successful if weather is sunny' do
				allow(flying_plane).to receive(:landed)
				expect(airport.land(flying_plane)).to eq "#{flying_plane} has landed."
			end

			it 'expects planes that wish to land to be flying' do
				message = "#{grounded_plane} is already on the ground."
				expect{airport.land(grounded_plane)}.to raise_error message
			end

		end

	end

	describe '#take_off' do

		before do
			allow(grounded_plane).to receive(:taken_off)
		end

		it 'expects take off to raise error if weather is stormy' do
			allow(airport).to receive(:stormy?) { false }
			allow(plane).to receive(:flying) { true }
			allow(plane).to receive(:landed)
			airport.land(plane)
			allow(plane).to receive(:flying) { false }
			allow(airport).to receive(:stormy?) { true }
			message = "#{plane} cannot take off due to stormy weather."
			expect{airport.take_off(plane)}.to raise_error message
		end

		context '#take_off tests that require non-stormy weather' do

			before do
				allow(airport).to receive(:stormy?) { false }
			end

			it 'expects take off to be successful if weather is sunny' do
				allow(plane).to receive(:flying) { true }
				allow(plane).to receive(:landed)
				airport.land(plane)
				allow(plane).to receive(:flying) { false }
				allow(plane).to receive(:taken_off)
				expect(airport.take_off(plane)).to eq "#{plane} has left the airport."
			end

			it 'expects planes that wish to take off to be at the airport' do
				message = "#{grounded_plane} does not exist at this airport."
				expect{airport.take_off(grounded_plane)}.to raise_error message
			end

			it 'expects planes that wish to take off to be grounded' do
				message = "#{flying_plane} is already flying."
				expect{airport.take_off(flying_plane)}.to raise_error
			end

		end

	end

	describe '#confirm_location' do

		it 'expects to confirm that a landed plane exists at the airport' do
			allow(airport).to receive(:stormy?) { false }
			allow(flying_plane).to receive(:landed)
			airport.land(flying_plane)
			expect(airport.confirm_location(flying_plane)).to eq "#{flying_plane} is at this airport."
		end

		it 'expects to confirm that a plane does not exist at the airport' do
			expect(airport.confirm_location(grounded_plane)).to eq "#{grounded_plane} has not landed at this airport."
		end

	end

end