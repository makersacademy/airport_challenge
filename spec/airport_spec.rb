require 'airport'
require 'plane'


describe Airport do
	subject(:airport){ described_class.new }

	it 'the airport has a default capacity' do
		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	describe 'attributes'
		# Check for the airport capacity attr_accessor
		it { is_expected.to respond_to :capacity }
		it { is_expected.to respond_to :capacity= }

		it 'allows for reading and writing for :airport_capacity' do
			airport.capacity = 10
			expect(airport.capacity).to eq(10)
		end

		it 'allows for reading and writing for :planes_on_the_ground' do
			airport.planes_on_the_ground = ['test']
			expect(airport.planes_on_the_ground.pop).to eq('test')
		end

		it 'allows for reading and writing for :planes_in_the_sky' do
			airport.planes_in_the_sky = ['test']
			expect(airport.planes_in_the_sky.pop).to eq('test')
		end

	# As an air traffic controller 
	# To ensure safety 
	# I want to prevent landing when the airport is full 
	it { is_expected.to respond_to :maximum_capacity? }

	# describe 'initialization' do
	# 	it 'raises an error when full' do
	# 	DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
	# 	expect { subject.dock Bike.new }.to raise_error 'Docking station full'
	# 	end
	# end

	# Planes on the ground
	it { is_expected.to respond_to :planes_on_the_ground }
	# Planes in the sky
	it { is_expected.to respond_to :planes_in_the_sky }

	# As an air traffic controller 
	# To ensure safety 
	# I want to prevent takeoff when weather is stormy
	it { is_expected.to respond_to :takeoff? }

	it { is_expected.to respond_to(:land).with(1).argument }

	it 'allows a plane to land on the runway' do
		plane = Plane.new
		expect(subject.land(plane).last).to eq plane
	end


	# As the system designer
	# So that the software can be used for many different airports
	# I would like a default airport capacity that can be overridden as appropriate
	it { is_expected.to respond_to :capacity }
	# check if airport_capacity is not equal to default capacity when instantiated as such

end