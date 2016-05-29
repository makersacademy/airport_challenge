require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
	subject(:airport1) {described_class.new}
	let(:plane1) {double (:plane)}
	let(:plane2) {double (:plane)}
	let(:plane3) {double (:plane)}
	let(:weather) {double (:weather)}
	let(:weather1) {double (:weather)}
	
	before do
		allow(plane1).to receive(:land)
		allow(plane2).to receive(:land)
		allow(plane3).to receive(:land)
		allow(plane1).to receive(:take_off)
		allow(plane1).to receive(:at_airport?) {false}
		allow(plane2).to receive(:at_airport?) {false}
		allow(plane3).to receive(:at_airport?) {true}
		allow(weather).to receive(:state) {'sunny'}
		allow(weather1).to receive(:state) {'stormy'}
	end

	describe '#incoming_plane' do
		
		it 'lands multiple planes in terminal when there is space and it is sunny' do
			airport.incoming_plane(plane1, weather.state)
			expect(airport.incoming_plane(plane2, weather.state)).to eq "Terminal:#{[plane1, plane2]}"
		end
		it 'raises error when airport is full' do
			Airport::DEFAULT_CAPACITY.times {airport.incoming_plane(Plane.new, weather.state)}
			expect{airport.incoming_plane(plane1, weather.state)}.to raise_error("Cannot land! Airport full!")
		end
		it 'raises error when weather is stormy' do
			expect{airport.incoming_plane(plane1, weather1.state)}.to raise_error("Cannot land! Too stormy!")
		end
		it 'does not allow plane to land if already at terminal' do
			airport.incoming_plane(plane1, weather.state)
			expect(airport.incoming_plane(plane1, weather.state)).to eq "#{plane1} has already landed!"
		end
		it 'does not allow plane to land if already landed elsewhere' do
			airport.incoming_plane(plane3, weather.state)
			expect(airport1.incoming_plane(plane3, weather.state)). to eq "#{plane3} has already landed elsewhere!"
		end
	end

	describe '#departing_plane' do
		it 'allows plane to take off when weather is sunny' do
			airport.incoming_plane(plane1, weather.state)
			expect(airport.departing_plane(plane1, weather.state)).to eq "#{plane1} is taking off!"
		end
		it 'raises error when weather is stormy' do
			airport.incoming_plane(plane1, weather.state)
			expect{airport.departing_plane(plane1, weather1.state)}.to raise_error("Cannot take off! Too stormy!")
		end
		it 'does not allow a plane to take off if it is not at the terminal' do
			expect(airport.departing_plane(plane1, weather.state)).to eq "#{plane1} is not at terminal!"
		end

	end

	describe '#terminal' do
		it 'displays planes that are currently in terminal' do
			airport.incoming_plane(plane1, weather.state)
			airport.incoming_plane(plane2, weather.state)
			airport.departing_plane(plane1, weather.state)
			expect(airport.terminal).to eq [plane2]
		end
	end
		
end