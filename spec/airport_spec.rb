require 'airport'

describe Airport do

	let(:plane) { double :plane }

	it 'responds to land method' do
		expect(subject).to respond_to(:land).with(1).argument
	end

	it 'allows plane to land' do
		allow(plane).to receive(:has_landed)
		subject.land(plane)
		expect(subject.planes.last).to eq(plane)
	end

	it 'changes status of plane to landed when plane has landed' do
		allow(plane).to receive(:has_landed)
		allow(plane).to receive(:landed?).and_return(true)
		subject.land(plane)
		expect(plane.landed?).to eq true
	end

	it 'raises an error if airport is full' do
		allow(plane).to receive(:has_landed)
		expect {
			(subject.capacity + 1).times do
				subject.land(plane)
			end
		}.to raise_error "airport is full"
	end

	it 'responds to takeoff method' do
		expect(subject).to respond_to(:takeoff).with(1).argument
	end

	it 'allows plane to take off' do
		allow(plane).to receive(:has_landed)
		allow(plane).to receive(:has_taken_off)
		subject.land(plane)
		expect(subject.takeoff(plane)).to eq(plane)
	end

	it 'changes status of plane to taken_off when plane has taken off' do
		allow(plane).to receive(:has_landed)
		allow(plane).to receive(:has_taken_off)
		allow(plane).to receive(:taken_off?).and_return(true)
		subject.land(plane)
		subject.takeoff(plane)
		expect(plane.taken_off?).to eq true

	end

	it 'raises an error if trying to takeoff with no planes' do
		expect { subject.takeoff(plane) }.to raise_error 'no planes to take off'
	end








end
