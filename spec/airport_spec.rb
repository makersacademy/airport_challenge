require 'airport'

describe Airport do

	it {is_expected.to respond_to(:land_plane).with(1).argument}
	
	it {is_expected.to respond_to(:take_off).with(1).argument}

	it 'can hold multiple planes' do
		allow(subject).to receive(:stormy?).and_return false
		subject.capacity.times{subject.land_plane(Plane.new)}
		expect(subject.grounded.count).to eq 10
	end

	it 'can have a custom capacity' do
		airport = Airport.new(5)
		allow(airport).to receive(:stormy?).and_return false
		airport.capacity.times{airport.land_plane(Plane.new)}
		expect{airport.land_plane(Plane.new)}.to raise_error("The airport is full!")
	end

	describe '#land_plane' do
		it 'allows planes to land in good weather' do
			allow(subject).to receive(:stormy?).and_return false
			plane = Plane.new
			expect(subject.land_plane(plane)).to eq [plane]
		end

		it 'raises an error when stormy' do
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.land_plane(Plane.new)}.to raise_error("Planes cannot land during storms!") 
		end

		it 'raises an error when airport is full' do
			allow(subject).to receive(:stormy?).and_return false
			subject.capacity.times{subject.land_plane(Plane.new)}
		 	expect{subject.land_plane(Plane.new)}.to raise_error("The airport is full!")
		end
	end

	describe '#take_off' do
		it 'allows planes to leave airport in good weather' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return false
			subject.land_plane(plane)
			expect(subject.take_off(plane)).to eq plane
		end

		it 'raises an error when stormy' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.take_off(plane)}.to raise_error("Planes cannot take off during storms!")
		end
	end

end