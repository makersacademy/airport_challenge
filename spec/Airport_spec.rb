require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
	subject(:airport1) {described_class.new}
	let(:plane1) {double :plane, land: (), take_off: (), at_airport?: false}
	let(:plane2) {double :plane, land: (), at_airport?: false}
	let(:plane3) {double :plane, land: (), at_airport?: true}
	let(:goodweather) {double :weather, state: 'sunny'}
	let(:badweather) {double :weather, state: 'stormy'}

	describe '#incoming_plane' do
		
		it 'lands multiple planes in terminal when there is space and it is sunny' do
			airport.incoming_plane(plane1, goodweather.state)
			expect(airport.incoming_plane(plane2, goodweather.state)).to eq "Terminal:#{[plane1, plane2]}"
		end
		it 'raises error when airport is full' do
			Airport::DEFAULT_CAPACITY.times {airport.incoming_plane(Plane.new, goodweather.state)}
			expect{airport.incoming_plane(plane1, goodweather.state)}.to raise_error("Cannot land! Airport full!")
		end
		it 'raises error when weather is stormy' do
			expect{airport.incoming_plane(plane1, badweather.state)}.to raise_error("Cannot land! Too stormy!")
		end
		it 'does not allow plane to land if already at terminal' do
			airport.incoming_plane(plane1, goodweather.state)
			expect(airport.incoming_plane(plane1, goodweather.state)).to eq "#{plane1} has already landed!"
		end
		it 'does not allow plane to land if already landed elsewhere' do
			airport.incoming_plane(plane3, goodweather.state)
			expect(airport1.incoming_plane(plane3, goodweather.state)). to eq "#{plane3} has already landed elsewhere!"
		end
	end

	describe '#departing_plane' do
		it 'allows plane to take off when weather is sunny' do
			airport.incoming_plane(plane1, goodweather.state)
			expect(airport.departing_plane(plane1, goodweather.state)).to eq "#{plane1} is taking off!"
		end
		it 'raises error when weather is stormy' do
			airport.incoming_plane(plane1, goodweather.state)
			expect{airport.departing_plane(plane1, badweather.state)}.to raise_error("Cannot take off! Too stormy!")
		end
		it 'does not allow a plane to take off if it is not at the terminal' do
			expect(airport.departing_plane(plane1, goodweather.state)).to eq "#{plane1} is not at terminal!"
		end

	end

	describe '#terminal' do
		it 'displays planes that are currently in terminal' do
			airport.incoming_plane(plane1, goodweather.state)
			airport.incoming_plane(plane2, goodweather.state)
			airport.departing_plane(plane1, goodweather.state)
			expect(airport.terminal).to eq [plane2]
		end
	end
		
end