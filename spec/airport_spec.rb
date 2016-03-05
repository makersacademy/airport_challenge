require 'airport'

describe Airport do

	let(:plane) { double :plane }

	it 'responds to land method' do
		expect(subject).to respond_to(:land).with(1).argument
	end

	it 'allows plane to land' do
		subject.land(plane)
		expect(subject.planes.last).to eq(plane)
	end

	it 'raises an error if airport is full' do
		expect {
			(subject.capacity + 1).times do
				subject.land(plane)
			end
		}.to raise_error "airport is full"
	end

	it 'responds to takeoff method' do
		expect(subject).to respond_to(:takeoff)
	end

	it 'allows plane to take off' do
		subject.land(plane)
		expect(subject.takeoff).to eq(plane)
	end

	it 'raises an error if trying to takeoff with no planes' do
		expect { subject.takeoff }.to raise_error 'no planes to take off'
	end

	it 'changes status of plane to landed when landed' do
		subject.land(plane)
		expect(plane.landed?).to eq true
	end







end
