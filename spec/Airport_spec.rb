require 'Airport'

describe Airport do

	subject(:airport) {described_class.new}
	
	describe '#incoming_plane' do
		it 'lands multiple planes in terminal when there is space and it is sunny' do
			plane1 = Plane.new
			plane2 = Plane.new
			airport.incoming_plane(plane1, 'sunny')
			expect(airport.incoming_plane(plane2, 'sunny')).to eq "Terminal:#{[plane1, plane2]}"
		end
		it 'raises error when airport is full' do
			10.times {airport.incoming_plane(Plane.new, 'sunny')}
			expect{airport.incoming_plane(Plane.new, 'sunny')}.to raise_error("Cannot land! Airport full!")
		end
		it 'raises error when weather is stormy' do
			expect{airport.incoming_plane(Plane.new, 'stormy')}.to raise_error("Cannot land! Too stormy!")
		end
	end

	describe '#departing_plane' do
		it 'allows plane to take off when weather is sunny' do
			plane = Plane.new
			airport.incoming_plane(plane, 'sunny')
			expect(airport.departing_plane(plane, 'sunny')).to eq "#{plane} is taking off!"
		end
		it 'raises error when weather is stormy' do
			plane = Plane.new
			airport.incoming_plane(plane, 'sunny')
			expect{airport.departing_plane(plane, 'stormy')}.to raise_error("Cannot take off! Too stormy!")
		end
	end

	describe '#terminal' do
		it 'displays planes that are currently in terminal' do
			plane1 = Plane.new
			plane2 = Plane.new
			airport.incoming_plane(plane1, 'sunny')
			airport.incoming_plane(plane2, 'sunny')
			airport.departing_plane(plane1, 'sunny')
			expect(airport.terminal).to eq [plane2]
		end
	end
		
end