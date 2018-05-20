require 'airport'
require 'plane'
require 'weather'

describe Airport do
	 subject(:airport) { described_class.new }
	 let(:plane) { Plane.new }

	 it 'the airport has a default capacity' do
 		 expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
 	end

	 describe 'attributes' do
 		# Snap check for the airport attr_accessors
 		 it { is_expected.to respond_to :capacity }
 		 it { is_expected.to respond_to :capacity= }	
 		 it { is_expected.to respond_to :planes_on_the_ground }
 		 it { is_expected.to respond_to :planes_on_the_ground= }
 		 it { is_expected.to respond_to :planes_in_the_sky }
 		 it { is_expected.to respond_to :planes_in_the_sky= }

 		# Attribute Read/Write tests
 		 it 'checks that the airport is being initialized with the default capacity' do
  			 expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  		end

 		# As the system designer
 		# So that the software can be used for many different airports
 		# I would like a default airport capacity that can be overridden as appropriate
 		 it 'allows for reading and writing for :airport_capacity' do
  			 airport.capacity = 10
  			 expect(airport.capacity).to eq(10)
  		end

 		 it 'allows for reading and writing for :planes_on_the_ground' do
  			 airport.planes_on_the_ground = [plane]
  			 expect(airport.planes_on_the_ground.pop).to eq(plane)
  		end

 		 it 'allows for reading and writing for :planes_in_the_sky' do
  			 airport.planes_in_the_sky = [plane]
  			 expect(airport.planes_in_the_sky.pop).to eq(plane)
  		end
 	end

	 describe 'maximum_capacity tests' do
  		# As an air traffic controller 
  		# To ensure safety 
  		# I want to prevent landing when the airport is full 
  		it 'returns true if the number of :planes_on_the_ground == :capacity' do
  			 Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
  			 expect(airport.maximum_capacity?).to eq(true)
  		end

  		it 'returns false if the number of :planes_on_the_ground < :capacity' do
  			 Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
  			 airport.takeoff
  			 expect(airport.maximum_capacity?).to eq(false)
  		end
  end

	 describe 'landing tests' do

  		it 'raises an error if a plane tries to land when there is no space' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land('MA370').to raise_error('No apron slots available') }
    end

  		it { is_expected.to respond_to(:land).with(1).argument }

		# As an air traffic controller
		# So I can get passengers to a destination 
		# I want to instruct a plane to land at an airport
  		it 'allows a plane to land on the runway' do
  			 expect(airport.land(plane).last).to eq plane
  		end

		# As an air traffic controller 
		# To ensure safety
		# I want to prevent landing when weather is stormy
		  it 'prevents a plane from landing when weather is stormy' do
  		end
		
  end

 	describe 'weather tests' do

 		 it 'asks someone to look out the window and check the weather' do
  		end

 	end

	# As an air traffic controller
	# So I can get passengers on the way to their destination 
	# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
	 describe 'takeoff tests' do
  		# As an air traffic controller 
  		# To ensure safety 
  		# I want to prevent takeoff when weather is stormy
  		it { is_expected.to respond_to(:takeoff).with(1).argument }

  end

	# Your code should defend against edge cases such as
	# inconsistent states of the system ensuring that planes
	# can only take off from airports they are in; planes
	# that are already flying cannot takes off and/or be in
	# an airport; planes that are landed cannot land again
	# and must be in an airport, etc.

end
