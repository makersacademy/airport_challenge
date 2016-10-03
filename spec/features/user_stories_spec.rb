describe 'user stories' do
	it 'tells a plane to land' do
		airport = Airport.new(20)
		plane = Plane.new
		allow(airport).to receive(:stormy?).and_return false
		expect { airport.land(plane) }.not_to raise_error
	end

	it 'tells a plane to take off' do
		airport = Airport.new(20)
		plane = Plane.new
		expect { airport.take_off(plane) }.not_to raise_error
	end

	it 'tells when full' do
		airport = Airport.new(20)
		plane = Plane.new
		allow(airport).to receive(:stormy?).and_return false
		20.times { airport.land(plane) }
		expect { airport.land(plane) }.to raise_error 'Airport full'
	end

	context 'when stormy' do
		it 'doesn\'t allow planes to land' do
			airport = Airport.new(20)
			plane = Plane.new
			allow(airport).to receive(:stormy?).and_return true
			expect { airport.land(plane) }.to raise_error 'Cannot land plane! Too stormy!'
		end
	end
end
