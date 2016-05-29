require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
	let(:plane1) {double (:plane)}
	let(:plane2) {double (:plane)}
	let(:weather) {double (:weather)}
	let(:weather1) {double (:weather)}
	
	before do
		allow(plane1).to receive(:land)
		allow(plane2).to receive(:land)
		allow(plane1).to receive(:take_off)
		allow(weather).to receive(:state) {'sunny'}
		allow(weather1).to receive(:state) {'stormy'}
	end

	describe '#incoming_plane' do
		
		it 'lands multiple planes in terminal when there is space and it is sunny' do
			airport.incoming_plane(plane1, weather.state)
			expect(airport.incoming_plane(plane2, weather.state)).to eq "Terminal:#{[plane1, plane2]}"
		end
		it 'raises error when airport is full' do
			Airport::DEFAULT_CAPACITY.times {airport.incoming_plane(plane1, weather.state)}
			expect{airport.incoming_plane(plane1, weather.state)}.to raise_error("Cannot land! Airport full!")
		end
		it 'raises error when weather is stormy' do
			expect{airport.incoming_plane(plane1, weather1.state)}.to raise_error("Cannot land! Too stormy!")
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