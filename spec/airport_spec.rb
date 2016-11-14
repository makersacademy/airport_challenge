require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
	let(:grounded_plane) {double(:plane, :flying => false)}
	let(:flying_plane) {double(:plane, :flying => true)}

	it 'expects airports to have a default capacity' do
		expect(airport.instance_variable_get(:@capacity)).to eq Airport::DEFAULT_CAPACITY
	end

	it 'expects new airports to accept a custom capacity' do
		airport = Airport.new(10)
		expect(airport.instance_variable_get(:@capacity)).to eq (10)
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
				allow(flying_plane).to receive(:landed)
			end

			it 'expects to hold a plane after it has landed' do
				airport.land(flying_plane)
				expect(airport.instance_variable_get(:@planes)).to include(flying_plane)
			end

			it 'expects a landing to be successful if weather is sunny' do
				expect(airport.land(flying_plane)).to eq "#{flying_plane} has landed."
			end

			it 'expects planes to be unable to land when airport is full' do
				(airport.instance_variable_get(:@capacity)).times {airport.land(flying_plane)}
				expect{airport.land(flying_plane)}.to raise_error("Airport is full.")
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
			allow(airport).to receive(:stormy?) { true }
			(airport.instance_variable_get(:@planes)) << grounded_plane
			message = "#{grounded_plane} cannot take off due to stormy weather."
			expect{airport.take_off(grounded_plane)}.to raise_error message
		end

		context '#take_off tests that require non-stormy weather' do

			before do
				allow(airport).to receive(:stormy?) { false }
			end

			it 'expects plane to have left the airport after it has taken off' do
				(airport.instance_variable_get(:@planes)) << grounded_plane
				airport.take_off(grounded_plane)
				expect(airport.instance_variable_get(:@planes)).not_to include(grounded_plane)
			end

			it 'expects take off to be successful if weather is sunny' do
				(airport.instance_variable_get(:@planes)) << grounded_plane
				expect(airport.take_off(grounded_plane)).to eq "#{grounded_plane} has left the airport."
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
			(airport.instance_variable_get(:@planes)) << grounded_plane
			expect(airport.confirm_location(grounded_plane)).to eq "#{grounded_plane} is at this airport."
		end

		it 'expects to confirm that a plane does not exist at the airport' do
			(airport.instance_variable_get(:@planes)) << grounded_plane
			airport1 = Airport.new
			expect(airport1.confirm_location(grounded_plane)).to eq "#{grounded_plane} has not landed at this airport."
		end

	end

end