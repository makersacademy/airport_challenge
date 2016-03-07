require 'airport'

describe Airport do

	let(:plane) { double :plane }
	let(:plane2) { double :plane }

	before(:each) do
		allow(plane).to receive(:landed)
		allow(plane).to receive(:taken_off)
		allow(plane2).to receive(:landed)
	end

	it 'responds to land method' do
		expect(subject).to respond_to(:land).with(1).argument
	end

	it 'allows plane to land' do
		subject.land(plane)
		expect(subject.planes.last).to eq(plane)
	end

	it 'changes status of plane to landed when plane has landed' do
		allow(plane).to receive(:has_landed?).and_return(true)
		subject.land(plane)
		expect(plane.has_landed?).to eq true
	end

	it 'raises an error if airport is full' do
		airport = Airport.new(0)
		expect { airport.land(plane) }.to raise_error "airport is full"
	end

	it 'raises an error if a plane which has already landed tries to land' do
		subject.land(plane)
		expect { subject.land(plane) }.to raise_error "plane has already landed"
	end

	it 'responds to takeoff method' do
		expect(subject).to respond_to(:takeoff).with(1).argument
	end

	it 'allows plane to take off' do
		subject.land(plane)
		expect(subject.takeoff(plane)).to eq(plane)
	end

	it 'changes status of plane to taken_off when plane has taken off' do
		allow(plane).to receive(:has_taken_off?).and_return(true)
		subject.land(plane)
		subject.takeoff(plane)
		expect(plane.has_taken_off?).to eq true

	end

	it 'raises an error if there are no planes to takeoff' do
		expect { subject.takeoff(plane) }.to raise_error "no planes to take off"
	end

	it 'raises an error if a plane which has already taken off tries to take off' do
		subject.land(plane)
		subject.land(plane2)
		subject.takeoff(plane)
		expect { subject.takeoff(plane) }.to raise_error "plane has already taken off"
	end

end
