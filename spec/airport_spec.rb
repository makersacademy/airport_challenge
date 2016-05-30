require 'airport'

describe Airport do


# describe "#land helps a plane land"
	it 'instructs a plane to land and confirms it has landed' do
	plane = Plane.new
	expect(subject.land(plane)).to eq [plane] && "Plane has landed"
	end

	it 'prevents landing when airport is full' do 
	plane = Plane.new
	capacity = Airport::DEFAULT_CAPACITY 
	expect{subject.land(plane)}.to raise_error('Cannot land: airport is full')
	end

	it 'raises an error and prevents landing when it is stormy' do 
	plane = Plane.new
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.land(plane)}. to raise_error "Cannot land: it is too dangerous to land in stormy weather"
	end 


	it 'Instructs a plane to take off' do
	plane = Plane.new
	expect(subject.take_off(plane)).to eq plane 
	end 

	it 'raises an error when the airport is empty and there are no planes to take-off' do
	plane = Plane.new
	expect{subject.take_off(plane)}.to raise_error("No planes available")

	end
	it 'raises an error and prevents take-off when it is stormy' do 
	plane = Plane.new
	allow(subject).to receive(:stormy?).and_return(true)
	expect{subject.take_off(plane)}. to raise_error "Cannot take-off: it is too dangerous to land in stormy weather"
	end 
end 
