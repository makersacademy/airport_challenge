require 'airport'

describe Airport do

	it 'can hold multiple planes' do
		allow(subject).to receive(:stormy?).and_return false
		subject.capacity.times{subject.receive_plane(Plane.new)}
		expect(subject.grounded.count).to eq 10
	end

	it 'can have a custom capacity' do
		airport = Airport.new(5)
		allow(airport).to receive(:stormy?).and_return false
		airport.capacity.times{airport.receive_plane(Plane.new)}
		expect{airport.receive_plane(Plane.new)}.to raise_error("The airport is full!")
	end

	describe '#receive_plane' do
		it 'allows planes to land in good weather' do
			allow(subject).to receive(:stormy?).and_return false
			plane = Plane.new
			expect(subject.receive_plane(plane)).to eq [plane]
		end

		it 'allows planes to land after take off' do
			allow(subject).to receive(:stormy?).and_return false
			plane = Plane.new
			subject.receive_plane(plane)
			subject.release_plane(plane)
			expect(subject.receive_plane(plane)).to eq [plane]
		end

		it 'raises an error when stormy' do
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.receive_plane(Plane.new)}.to raise_error("Planes cannot land during storms!") 
		end

		it 'raises an error when airport is full' do
			allow(subject).to receive(:stormy?).and_return false
			subject.capacity.times{subject.receive_plane(Plane.new)}
		 	expect{subject.receive_plane(Plane.new)}.to raise_error("The airport is full!")
		end

		it 'raises an error when a plane is already grounded' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return false
			subject.receive_plane(plane)
			expect{subject.receive_plane(plane)}.to raise_error("That plane is already grounded!")
		end

	end

	describe '#release_plane' do
		it 'allows planes to leave airport in good weather' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return false
			subject.receive_plane(plane)
			expect(subject.release_plane(plane)).to eq plane
		end

		it 'raises an error when stormy' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return true
			expect{subject.release_plane(plane)}.to raise_error("Planes cannot take off during storms!")
		end

		it 'raises and error when plane is not present' do
			plane = Plane.new
			allow(subject).to receive(:stormy?).and_return false
			expect{subject.release_plane(plane)}.to raise_error("That plane is not in the airport!")
		end

	end

end