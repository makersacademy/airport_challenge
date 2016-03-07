require 'airport'

describe Airport do

	let(:plane) { double :plane }
	let(:plane2) { double :plane }

	before(:each) do
		allow(plane).to receive(:landed)
		allow(plane).to receive(:taken_off)
		allow(plane2).to receive(:landed)
		allow(plane).to receive(:airborne)
	end

	context 'landing planes' do

		it 'allows plane to land' do
			subject.land(plane)
			expect(subject.planes.last).to eq(plane)
		end

		it 'raises an error if airport is full' do
			airport = Airport.new(0)
			expect { airport.land(plane) }.to raise_error "airport is full"
		end

	end

	context 'planes taking off' do

		it 'allows plane to take off' do
			subject.land(plane)
			expect(subject.takeoff(plane)).to eq(plane)
		end

		it 'raises an error if there are no planes to takeoff' do
			expect { subject.takeoff(plane) }.to raise_error "no planes to take off"
		end

	end

end
