require 'airport'

describe Airport do


# describe "#land helps a plane land"
	#instruct a plane to land and confirm landed
	it 'instructs a plane to land' do
	plane = Plane.new
	expect(subject.land(plane)).to eq [plane]
	end

	it 'does not allow landing when airport full' do 
	plane = Plane.new
	capacity = Airport::DEFAULT_CAPACITY 
	capacity.times {subject.land(Plane.new)}
	allow(subject).to receive(:stormy?).and_return(false)
	expect{subject.land(plane)}.to raise_error('Airport is full')
	end

	it 'does not allow landing when stormy' do 
	plane = Plane.new
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.land(plane)}. to raise_error "Too stormy to land"
	end 


	it 'instructs a plane to take off' do
	plane = Plane.new
	subject.land(plane)
	expect(subject.take_off(plane)).to eq plane 
	end 

	it 'raises an error when the airport is empty and there are no planes' do
	plane = Plane.new
	allow(subject).to receive(:stormy?).and_return(false)
	expect{subject.take_off(plane)}.to raise_error("No planes available")

	end
	it 'does not allow takeoff when stormy' do 
	plane = Plane.new
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.take_off(plane)}. to raise_error "Too stormy to take off"
	end 
end 
