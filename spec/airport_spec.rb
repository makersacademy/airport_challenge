require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
let (:plane) { Plane.new }

	it { is_expected.to respond_to(:land).with(1).argument }

	it 'has a default capacity' do
		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	end

  	it 'lands a plane' do
		  allow(subject.weather).to receive(:stormy?).and_return(false)
	  	expect(subject.land(plane)).to eq plane
	  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

	it { is_expected.to respond_to(:take_off).with(1).argument }

	it 'takes off a plane, with confirmation that it is no longer in the airport' do
		allow(subject.weather).to receive(:stormy?).and_return(false)
		subject.land(plane)
		expect(subject.take_off(plane)).to eq 'The plane has taken off and is no longer in the airport'
		expect(subject.planes.include? plane).to eq false
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

	it 'will prevent landing when the airport is full, by raising an error' do
		allow(subject.weather).to receive(:stormy?).and_return(false)
		Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
		expect { subject.land(Plane.new) }.to raise_error 'this airport is full!'
	end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

	it 'can change airport capacity' do
		expect(subject.change_capacity(20)).to eq 20
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

	it 'will prevent landings when weather is stormy' do
		allow(subject.weather).to receive(:stormy?).and_return(true)
		expect{subject.land(plane)}.to raise_error 'You cant land! The weather is stormy!'
	end

	it 'will prevent take-offs when weather is stormy' do
		allow(subject.weather).to receive(:stormy?).and_return(false)
		subject.land(plane)
		allow(subject.weather).to receive(:stormy?).and_return(true)
		expect{subject.take_off(plane)}.to raise_error 'You cant take off! The weather is stormy!'
	end

	it 'will throw error if you try and land a plane twice' do
		allow(subject.weather).to receive(:stormy?).and_return(false)
		subject.land(plane)
		expect{subject.land(plane)}.to raise_error 'This plane has already landed.' 
	end
	
	it 'will throw error if you try and take-off a flying plane' do
		expect{subject.take_off(plane)}.to raise_error 'This plane is already flying.'
	end
end

